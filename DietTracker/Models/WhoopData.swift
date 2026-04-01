import Foundation

// MARK: - Whoop API Models

struct WhoopDailyData: Identifiable, Codable {
    let id: UUID
    var date: Date
    var strain: Double              // 0-21 escala Whoop
    var recoveryScore: Double       // 0-100%
    var sleepScore: Double          // 0-100%
    var hrv: Double                 // ms
    var restingHeartRate: Double    // bpm
    var totalCaloriesBurned: Double // kcal (basal + atividade)
    var activeCaloriesBurned: Double // kcal
    var sleepHours: Double          // horas
    var activities: [WhoopActivity]

    init(
        id: UUID = UUID(),
        date: Date = Date(),
        strain: Double = 0,
        recoveryScore: Double = 0,
        sleepScore: Double = 0,
        hrv: Double = 0,
        restingHeartRate: Double = 0,
        totalCaloriesBurned: Double = 0,
        activeCaloriesBurned: Double = 0,
        sleepHours: Double = 0,
        activities: [WhoopActivity] = []
    ) {
        self.id = id
        self.date = date
        self.strain = strain
        self.recoveryScore = recoveryScore
        self.sleepScore = sleepScore
        self.hrv = hrv
        self.restingHeartRate = restingHeartRate
        self.totalCaloriesBurned = totalCaloriesBurned
        self.activeCaloriesBurned = activeCaloriesBurned
        self.sleepHours = sleepHours
        self.activities = activities
    }

    var basalCalories: Double {
        totalCaloriesBurned - activeCaloriesBurned
    }

    var recoveryColor: String {
        switch recoveryScore {
        case 67...100: return "green"
        case 34...66: return "yellow"
        default: return "red"
        }
    }

    var strainLevel: String {
        switch strain {
        case 0..<8: return "Leve"
        case 8..<14: return "Moderado"
        case 14..<18: return "Alto"
        default: return "Máximo"
        }
    }
}

struct WhoopActivity: Identifiable, Codable {
    let id: UUID
    var name: String
    var sportId: Int
    var strain: Double
    var calories: Double
    var duration: TimeInterval    // segundos
    var averageHeartRate: Double
    var maxHeartRate: Double
    var startTime: Date
    var endTime: Date

    init(
        id: UUID = UUID(),
        name: String = "",
        sportId: Int = 0,
        strain: Double = 0,
        calories: Double = 0,
        duration: TimeInterval = 0,
        averageHeartRate: Double = 0,
        maxHeartRate: Double = 0,
        startTime: Date = Date(),
        endTime: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.sportId = sportId
        self.strain = strain
        self.calories = calories
        self.duration = duration
        self.averageHeartRate = averageHeartRate
        self.maxHeartRate = maxHeartRate
        self.startTime = startTime
        self.endTime = endTime
    }

    var durationFormatted: String {
        let hours = Int(duration) / 3600
        let minutes = (Int(duration) % 3600) / 60
        if hours > 0 {
            return "\(hours)h \(minutes)min"
        }
        return "\(minutes)min"
    }
}

// MARK: - Whoop API Response Models

struct WhoopTokenResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case expiresIn = "expires_in"
    }
}

struct WhoopCycleResponse: Codable {
    let id: Int
    let start: String
    let end: String?
    let score: WhoopCycleScore?

    struct WhoopCycleScore: Codable {
        let strain: Double
        let kilojoule: Double
        let averageHeartRate: Double
        let maxHeartRate: Double

        enum CodingKeys: String, CodingKey {
            case strain
            case kilojoule
            case averageHeartRate = "average_heart_rate"
            case maxHeartRate = "max_heart_rate"
        }
    }
}

struct WhoopRecoveryResponse: Codable {
    let cycleId: Int
    let score: WhoopRecoveryScore

    struct WhoopRecoveryScore: Codable {
        let recoveryScore: Double
        let restingHeartRate: Double
        let hrvRmssd: Double

        enum CodingKeys: String, CodingKey {
            case recoveryScore = "recovery_score"
            case restingHeartRate = "resting_heart_rate"
            case hrvRmssd = "hrv_rmssd_milli"
        }
    }

    enum CodingKeys: String, CodingKey {
        case cycleId = "cycle_id"
        case score
    }
}

struct WhoopSleepResponse: Codable {
    let id: Int
    let start: String
    let end: String
    let score: WhoopSleepScore?

    struct WhoopSleepScore: Codable {
        let sleepPerformancePercentage: Double?
        let totalInBedTimeMilli: Int

        enum CodingKeys: String, CodingKey {
            case sleepPerformancePercentage = "sleep_performance_percentage"
            case totalInBedTimeMilli = "total_in_bed_time_milli"
        }
    }
}

struct WhoopWorkoutResponse: Codable {
    let id: Int
    let start: String
    let end: String
    let sportId: Int
    let score: WhoopWorkoutScore?

    struct WhoopWorkoutScore: Codable {
        let strain: Double
        let kilojoule: Double
        let averageHeartRate: Double
        let maxHeartRate: Double

        enum CodingKeys: String, CodingKey {
            case strain
            case kilojoule
            case averageHeartRate = "average_heart_rate"
            case maxHeartRate = "max_heart_rate"
        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case start
        case end
        case sportId = "sport_id"
        case score
    }
}
