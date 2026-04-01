import Foundation

struct UserProfile: Codable {
    var name: String
    var age: Int
    var weight: Double          // kg
    var height: Double          // cm
    var gender: Gender
    var activityLevel: ActivityLevel
    var dietGoal: DietGoal
    var whoopConnected: Bool
    var notificationsEnabled: Bool
    var notificationTimes: [NotificationTime]

    init(
        name: String = "",
        age: Int = 30,
        weight: Double = 80,
        height: Double = 175,
        gender: Gender = .male,
        activityLevel: ActivityLevel = .moderate,
        dietGoal: DietGoal = .maintain,
        whoopConnected: Bool = false,
        notificationsEnabled: Bool = true,
        notificationTimes: [NotificationTime] = NotificationTime.defaults
    ) {
        self.name = name
        self.age = age
        self.weight = weight
        self.height = height
        self.gender = gender
        self.activityLevel = activityLevel
        self.dietGoal = dietGoal
        self.whoopConnected = whoopConnected
        self.notificationsEnabled = notificationsEnabled
        self.notificationTimes = notificationTimes
    }

    // Taxa Metabólica Basal (Harris-Benedict)
    var bmr: Double {
        switch gender {
        case .male:
            return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * Double(age))
        case .female:
            return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * Double(age))
        }
    }

    // Total Daily Energy Expenditure
    var tdee: Double {
        bmr * activityLevel.multiplier
    }

    // Meta calórica sugerida baseada no objetivo
    var suggestedCalorieTarget: Double {
        switch dietGoal {
        case .lose: return tdee - 500
        case .maintain: return tdee
        case .gain: return tdee + 300
        }
    }
}

enum Gender: String, Codable, CaseIterable {
    case male = "Masculino"
    case female = "Feminino"
}

enum ActivityLevel: String, Codable, CaseIterable {
    case sedentary = "Sedentário"
    case light = "Levemente Ativo"
    case moderate = "Moderadamente Ativo"
    case active = "Muito Ativo"
    case veryActive = "Extremamente Ativo"

    var multiplier: Double {
        switch self {
        case .sedentary: return 1.2
        case .light: return 1.375
        case .moderate: return 1.55
        case .active: return 1.725
        case .veryActive: return 1.9
        }
    }
}

enum DietGoal: String, Codable, CaseIterable {
    case lose = "Perder Peso"
    case maintain = "Manter Peso"
    case gain = "Ganhar Massa"

    var icon: String {
        switch self {
        case .lose: return "arrow.down.circle.fill"
        case .maintain: return "equal.circle.fill"
        case .gain: return "arrow.up.circle.fill"
        }
    }
}

struct NotificationTime: Codable, Identifiable {
    let id: UUID
    var hour: Int
    var minute: Int
    var label: String
    var isEnabled: Bool

    init(id: UUID = UUID(), hour: Int, minute: Int, label: String, isEnabled: Bool = true) {
        self.id = id
        self.hour = hour
        self.minute = minute
        self.label = label
        self.isEnabled = isEnabled
    }

    var timeString: String {
        String(format: "%02d:%02d", hour, minute)
    }

    static var defaults: [NotificationTime] {
        [
            NotificationTime(hour: 7, minute: 30, label: "Lembrete Café da Manhã"),
            NotificationTime(hour: 12, minute: 0, label: "Lembrete Almoço"),
            NotificationTime(hour: 15, minute: 0, label: "Check-in da Tarde"),
            NotificationTime(hour: 19, minute: 0, label: "Lembrete Jantar"),
            NotificationTime(hour: 21, minute: 0, label: "Resumo do Dia")
        ]
    }
}
