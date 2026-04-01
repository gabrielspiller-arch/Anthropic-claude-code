import Foundation

struct MealEntry: Identifiable, Codable {
    let id: UUID
    var foodItem: FoodItem
    var quantity: Double       // multiplicador da porção
    var mealType: MealType
    var date: Date
    var notes: String

    init(
        id: UUID = UUID(),
        foodItem: FoodItem,
        quantity: Double = 1.0,
        mealType: MealType,
        date: Date = Date(),
        notes: String = ""
    ) {
        self.id = id
        self.foodItem = foodItem
        self.quantity = quantity
        self.mealType = mealType
        self.date = date
        self.notes = notes
    }

    var totalCalories: Double { foodItem.calories * quantity }
    var totalProtein: Double { foodItem.protein * quantity }
    var totalCarbs: Double { foodItem.carbs * quantity }
    var totalFat: Double { foodItem.fat * quantity }
    var totalFiber: Double { foodItem.fiber * quantity }
}

enum MealType: String, Codable, CaseIterable {
    case breakfast = "Café da Manhã"
    case morningSnack = "Lanche da Manhã"
    case lunch = "Almoço"
    case afternoonSnack = "Lanche da Tarde"
    case dinner = "Jantar"
    case eveningSnack = "Ceia"

    var icon: String {
        switch self {
        case .breakfast: return "sunrise.fill"
        case .morningSnack: return "sun.haze.fill"
        case .lunch: return "sun.max.fill"
        case .afternoonSnack: return "sun.dust.fill"
        case .dinner: return "moon.haze.fill"
        case .eveningSnack: return "moon.stars.fill"
        }
    }

    var sortOrder: Int {
        switch self {
        case .breakfast: return 0
        case .morningSnack: return 1
        case .lunch: return 2
        case .afternoonSnack: return 3
        case .dinner: return 4
        case .eveningSnack: return 5
        }
    }
}
