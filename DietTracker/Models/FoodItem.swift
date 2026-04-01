import Foundation

struct FoodItem: Identifiable, Codable, Hashable {
    let id: UUID
    var name: String
    var calories: Double
    var protein: Double      // gramas
    var carbs: Double        // gramas
    var fat: Double          // gramas
    var fiber: Double        // gramas
    var portionSize: Double  // gramas
    var portionUnit: String
    var category: FoodCategory
    var isFavorite: Bool

    init(
        id: UUID = UUID(),
        name: String,
        calories: Double,
        protein: Double,
        carbs: Double,
        fat: Double,
        fiber: Double = 0,
        portionSize: Double = 100,
        portionUnit: String = "g",
        category: FoodCategory = .other,
        isFavorite: Bool = false
    ) {
        self.id = id
        self.name = name
        self.calories = calories
        self.protein = protein
        self.carbs = carbs
        self.fat = fat
        self.fiber = fiber
        self.portionSize = portionSize
        self.portionUnit = portionUnit
        self.category = category
        self.isFavorite = isFavorite
    }
}

enum FoodCategory: String, Codable, CaseIterable {
    case protein = "Proteínas"
    case carbs = "Carboidratos"
    case vegetables = "Vegetais"
    case fruits = "Frutas"
    case dairy = "Laticínios"
    case fats = "Gorduras"
    case snacks = "Lanches"
    case beverages = "Bebidas"
    case supplements = "Suplementos"
    case other = "Outros"

    var icon: String {
        switch self {
        case .protein: return "fish.fill"
        case .carbs: return "leaf.fill"
        case .vegetables: return "carrot.fill"
        case .fruits: return "apple.logo"
        case .dairy: return "cup.and.saucer.fill"
        case .fats: return "drop.fill"
        case .snacks: return "birthday.cake.fill"
        case .beverages: return "mug.fill"
        case .supplements: return "pill.fill"
        case .other: return "ellipsis.circle.fill"
        }
    }

    var color: String {
        switch self {
        case .protein: return "red"
        case .carbs: return "orange"
        case .vegetables: return "green"
        case .fruits: return "yellow"
        case .dairy: return "blue"
        case .fats: return "purple"
        case .snacks: return "pink"
        case .beverages: return "cyan"
        case .supplements: return "mint"
        case .other: return "gray"
        }
    }
}
