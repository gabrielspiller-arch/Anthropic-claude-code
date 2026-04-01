import Foundation
import SwiftUI
import AuthenticationServices

class WhoopService: ObservableObject {
    static let shared = WhoopService()

    // MARK: - Whoop API Configuration
    // Register your app at https://developer.whoop.com
    // Set these values from your Whoop Developer Portal
    private let clientId = "YOUR_WHOOP_CLIENT_ID"
    private let clientSecret = "YOUR_WHOOP_CLIENT_SECRET"
    private let redirectUri = "diettracker://whoop/callback"
    private let baseURL = "https://api.prod.whoop.com/developer/v1"
    private let authURL = "https://api.prod.whoop.com/oauth/oauth2/auth"
    private let tokenURL = "https://api.prod.whoop.com/oauth/oauth2/token"

    @Published var isConnected = false
    @Published var isLoading = false
    @Published var lastSyncDate: Date?
    @Published var todayData: WhoopDailyData?
    @Published var weeklyData: [WhoopDailyData] = []
    @Published var errorMessage: String?

    private var accessToken: String? {
        get { UserDefaults.standard.string(forKey: "whoop_access_token") }
        set { UserDefaults.standard.set(newValue, forKey: "whoop_access_token") }
    }

    private var refreshToken: String? {
        get { UserDefaults.standard.string(forKey: "whoop_refresh_token") }
        set { UserDefaults.standard.set(newValue, forKey: "whoop_refresh_token") }
    }

    private init() {
        isConnected = accessToken != nil
    }

    // MARK: - OAuth2 Authorization

    var authorizationURL: URL {
        var components = URLComponents(string: authURL)!
        components.queryItems = [
            URLQueryItem(name: "client_id", value: clientId),
            URLQueryItem(name: "redirect_uri", value: redirectUri),
            URLQueryItem(name: "response_type", value: "code"),
            URLQueryItem(name: "scope", value: "read:recovery read:cycles read:workout read:sleep read:profile read:body_measurement"),
            URLQueryItem(name: "state", value: UUID().uuidString)
        ]
        return components.url!
    }

    func handleCallback(url: URL) async {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let code = components.queryItems?.first(where: { $0.name == "code" })?.value else {
            await MainActor.run { errorMessage = "Código de autorização não encontrado." }
            return
        }
        await exchangeCodeForToken(code: code)
    }

    private func exchangeCodeForToken(code: String) async {
        let body = [
            "grant_type": "authorization_code",
            "code": code,
            "client_id": clientId,
            "client_secret": clientSecret,
            "redirect_uri": redirectUri
        ]

        guard let tokenResponse: WhoopTokenResponse = await postRequest(url: tokenURL, body: body) else {
            return
        }

        await MainActor.run {
            self.accessToken = tokenResponse.accessToken
            self.refreshToken = tokenResponse.refreshToken
            self.isConnected = true
        }

        await fetchTodayData()
    }

    private func refreshAccessToken() async -> Bool {
        guard let refreshToken = refreshToken else { return false }

        let body = [
            "grant_type": "refresh_token",
            "refresh_token": refreshToken,
            "client_id": clientId,
            "client_secret": clientSecret
        ]

        guard let tokenResponse: WhoopTokenResponse = await postRequest(url: tokenURL, body: body) else {
            await MainActor.run {
                self.isConnected = false
                self.accessToken = nil
                self.refreshToken = nil
            }
            return false
        }

        await MainActor.run {
            self.accessToken = tokenResponse.accessToken
            self.refreshToken = tokenResponse.refreshToken
        }
        return true
    }

    // MARK: - Data Fetching

    func fetchTodayData() async {
        await MainActor.run { isLoading = true }

        let today = ISO8601DateFormatter().string(from: Calendar.current.startOfDay(for: Date()))

        // Fetch cycle (strain & calories)
        let cycleData = await fetchCycles(start: today)
        let recoveryData = await fetchRecovery()
        let sleepData = await fetchSleep(start: today)
        let workouts = await fetchWorkouts(start: today)

        let dailyData = buildDailyData(
            date: Date(),
            cycle: cycleData?.first,
            recovery: recoveryData,
            sleep: sleepData?.first,
            workouts: workouts ?? []
        )

        await MainActor.run {
            self.todayData = dailyData
            self.isLoading = false
            self.lastSyncDate = Date()
            self.errorMessage = nil
        }

        // Save to persistence
        if let data = dailyData {
            PersistenceController.shared.saveWhoopData(data)
        }

        // Send notification with Whoop data
        if let data = dailyData {
            NotificationService.shared.sendWhoopSyncNotification(
                caloriesBurned: data.totalCaloriesBurned,
                strain: data.strain,
                recovery: data.recoveryScore
            )
        }
    }

    func fetchWeeklyData() async {
        let calendar = Calendar.current
        let startDate = calendar.date(byAdding: .day, value: -7, to: Date())!
        let startStr = ISO8601DateFormatter().string(from: startDate)

        let cycles = await fetchCycles(start: startStr)
        var weekly: [WhoopDailyData] = []

        for i in 0..<7 {
            let date = calendar.date(byAdding: .day, value: -i, to: Date())!
            let cycle = cycles?.first { cycleDateMatches($0, date: date) }
            if let data = buildDailyData(date: date, cycle: cycle, recovery: nil, sleep: nil, workouts: []) {
                weekly.append(data)
            }
        }

        await MainActor.run {
            self.weeklyData = weekly.reversed()
        }
    }

    // MARK: - API Calls

    private func fetchCycles(start: String) async -> [WhoopCycleResponse]? {
        await getRequest(endpoint: "/cycle?start=\(start)")
    }

    private func fetchRecovery() async -> WhoopRecoveryResponse? {
        let recoveries: [WhoopRecoveryResponse]? = await getRequest(endpoint: "/recovery?limit=1")
        return recoveries?.first
    }

    private func fetchSleep(start: String) async -> [WhoopSleepResponse]? {
        await getRequest(endpoint: "/activity/sleep?start=\(start)")
    }

    private func fetchWorkouts(start: String) async -> [WhoopWorkoutResponse]? {
        await getRequest(endpoint: "/activity/workout?start=\(start)")
    }

    // MARK: - Helper Methods

    private func buildDailyData(
        date: Date,
        cycle: WhoopCycleResponse?,
        recovery: WhoopRecoveryResponse?,
        sleep: WhoopSleepResponse?,
        workouts: [WhoopWorkoutResponse]
    ) -> WhoopDailyData? {
        let strain = cycle?.score?.strain ?? 0
        let kilojoules = cycle?.score?.kilojoule ?? 0
        let totalCalories = kilojoules / 4.184  // kJ to kcal

        let activities = workouts.map { workout in
            WhoopActivity(
                name: sportName(for: workout.sportId),
                sportId: workout.sportId,
                strain: workout.score?.strain ?? 0,
                calories: (workout.score?.kilojoule ?? 0) / 4.184,
                averageHeartRate: workout.score?.averageHeartRate ?? 0,
                maxHeartRate: workout.score?.maxHeartRate ?? 0
            )
        }

        let activeCalories = activities.reduce(0) { $0 + $1.calories }
        let sleepHours = Double(sleep?.score?.totalInBedTimeMilli ?? 0) / 3_600_000.0

        return WhoopDailyData(
            date: date,
            strain: strain,
            recoveryScore: recovery?.score.recoveryScore ?? 0,
            sleepScore: sleep?.score?.sleepPerformancePercentage ?? 0,
            hrv: recovery?.score.hrvRmssd ?? 0,
            restingHeartRate: recovery?.score.restingHeartRate ?? 0,
            totalCaloriesBurned: totalCalories,
            activeCaloriesBurned: activeCalories,
            sleepHours: sleepHours,
            activities: activities
        )
    }

    private func cycleDateMatches(_ cycle: WhoopCycleResponse, date: Date) -> Bool {
        let formatter = ISO8601DateFormatter()
        guard let cycleDate = formatter.date(from: cycle.start) else { return false }
        return Calendar.current.isDate(cycleDate, inSameDayAs: date)
    }

    private func sportName(for id: Int) -> String {
        let sports: [Int: String] = [
            0: "Atividade", 1: "Corrida", 16: "Musculação",
            33: "CrossFit", 43: "Ciclismo", 44: "Natação",
            48: "HIIT", 52: "Yoga", 63: "Jiu-Jitsu",
            71: "Caminhada", 84: "Futebol"
        ]
        return sports[id] ?? "Atividade (\(id))"
    }

    // MARK: - Network

    private func getRequest<T: Decodable>(endpoint: String) async -> T? {
        guard let token = accessToken else { return nil }

        guard let url = URL(string: "\(baseURL)\(endpoint)") else { return nil }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        do {
            let (data, response) = try await URLSession.shared.data(for: request)

            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 401 {
                if await refreshAccessToken() {
                    return await getRequest(endpoint: endpoint)
                }
                return nil
            }

            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            await MainActor.run { errorMessage = "Erro ao buscar dados: \(error.localizedDescription)" }
            return nil
        }
    }

    private func postRequest<T: Decodable>(url: String, body: [String: String]) async -> T? {
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let bodyString = body.map { "\($0.key)=\($0.value)" }.joined(separator: "&")
        request.httpBody = bodyString.data(using: .utf8)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            await MainActor.run { errorMessage = "Erro de autenticação: \(error.localizedDescription)" }
            return nil
        }
    }

    // MARK: - Disconnect

    func disconnect() {
        accessToken = nil
        refreshToken = nil
        isConnected = false
        todayData = nil
        weeklyData = []
        lastSyncDate = nil
    }
}
