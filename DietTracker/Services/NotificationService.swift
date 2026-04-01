import Foundation
import UserNotifications
import SwiftUI

class NotificationService: ObservableObject {
    static let shared = NotificationService()

    @Published var isAuthorized = false

    private init() {}

    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [weak self] granted, _ in
            DispatchQueue.main.async {
                self?.isAuthorized = granted
            }
        }
    }

    // MARK: - Schedule Daily Goal Notifications

    func scheduleAllNotifications(profile: UserProfile, goal: DailyGoal) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        guard profile.notificationsEnabled else { return }

        for notifTime in profile.notificationTimes where notifTime.isEnabled {
            scheduleNotification(
                time: notifTime,
                goal: goal,
                profile: profile
            )
        }

        scheduleDailySummaryReminder(goal: goal)
    }

    private func scheduleNotification(time: NotificationTime, goal: DailyGoal, profile: UserProfile) {
        let content = UNMutableNotificationContent()
        content.title = "DietTracker"
        content.body = notificationBody(for: time, goal: goal)
        content.sound = .default
        content.badge = 1
        content.categoryIdentifier = "MEAL_REMINDER"

        var dateComponents = DateComponents()
        dateComponents.hour = time.hour
        dateComponents.minute = time.minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: "meal_\(time.id.uuidString)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    private func notificationBody(for time: NotificationTime, goal: DailyGoal) -> String {
        switch time.label {
        case "Lembrete Café da Manhã":
            return "Bom dia! Hora de registrar seu café da manhã. Meta: \(Int(goal.calorieTarget)) kcal hoje."
        case "Lembrete Almoço":
            return "Hora do almoço! Não esqueça de registrar sua refeição."
        case "Check-in da Tarde":
            return "Como está indo sua dieta? Confira seu progresso e registre seus lanches."
        case "Lembrete Jantar":
            return "Hora do jantar! Veja quanto falta para sua meta diária."
        case "Resumo do Dia":
            return "Fim do dia! Confira seu resumo de calorias e macros."
        default:
            return time.label
        }
    }

    // MARK: - Daily Summary Notification

    private func scheduleDailySummaryReminder(goal: DailyGoal) {
        let content = UNMutableNotificationContent()
        content.title = "Resumo Diário"
        content.body = "Sua meta de gasto calórico hoje é \(Int(goal.calorieBurnTarget)) kcal. Confira os dados do Whoop!"
        content.sound = .default
        content.categoryIdentifier = "DAILY_SUMMARY"

        var dateComponents = DateComponents()
        dateComponents.hour = 22
        dateComponents.minute = 0

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(
            identifier: "daily_summary",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    // MARK: - Goal Progress Notifications

    func sendGoalProgressNotification(consumed: Double, target: Double, burned: Double, burnTarget: Double) {
        let remaining = target - consumed
        let burnRemaining = burnTarget - burned

        let content = UNMutableNotificationContent()
        content.title = "Progresso da Meta"
        content.sound = .default

        if remaining > 0 {
            content.body = "Faltam \(Int(remaining)) kcal para sua meta de consumo. Gasto: \(Int(burned))/\(Int(burnTarget)) kcal."
        } else {
            content.body = "Meta de consumo atingida! Gasto atual: \(Int(burned))/\(Int(burnTarget)) kcal."
        }

        if burnRemaining <= 0 {
            content.body += " Parabéns, meta de gasto atingida!"
        }

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(
            identifier: "goal_progress_\(UUID().uuidString)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    // MARK: - Whoop Sync Notification

    func sendWhoopSyncNotification(caloriesBurned: Double, strain: Double, recovery: Double) {
        let content = UNMutableNotificationContent()
        content.title = "Whoop Atualizado"
        content.body = "Gasto: \(Int(caloriesBurned)) kcal | Strain: \(String(format: "%.1f", strain)) | Recovery: \(Int(recovery))%"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(
            identifier: "whoop_sync_\(UUID().uuidString)",
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }

    // MARK: - Notification Actions

    func registerCategories() {
        let logAction = UNNotificationAction(
            identifier: "LOG_MEAL",
            title: "Registrar Refeição",
            options: .foreground
        )

        let viewAction = UNNotificationAction(
            identifier: "VIEW_PROGRESS",
            title: "Ver Progresso",
            options: .foreground
        )

        let mealCategory = UNNotificationCategory(
            identifier: "MEAL_REMINDER",
            actions: [logAction, viewAction],
            intentIdentifiers: []
        )

        let summaryCategory = UNNotificationCategory(
            identifier: "DAILY_SUMMARY",
            actions: [viewAction],
            intentIdentifiers: []
        )

        UNUserNotificationCenter.current().setNotificationCategories([mealCategory, summaryCategory])
    }
}
