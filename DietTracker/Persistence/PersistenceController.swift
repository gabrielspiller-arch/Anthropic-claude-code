import Foundation
import SwiftUI
import Combine

class PersistenceController: ObservableObject {
    static let shared = PersistenceController()

    @Published var userProfile: UserProfile
    @Published var dailyGoal: DailyGoal
    @Published var mealEntries: [MealEntry] = []
    @Published var foodDatabase: [FoodItem] = []
    @Published var whoopHistory: [WhoopDailyData] = []
    @Published var waterIntake: Double = 0

    private let userDefaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    private init() {
        // Load user profile
        if let data = userDefaults.data(forKey: "userProfile"),
           let profile = try? JSONDecoder().decode(UserProfile.self, from: data) {
            self.userProfile = profile
        } else {
            self.userProfile = UserProfile()
        }

        // Load daily goal
        if let data = userDefaults.data(forKey: "dailyGoal"),
           let goal = try? JSONDecoder().decode(DailyGoal.self, from: data) {
            self.dailyGoal = goal
        } else {
            self.dailyGoal = DailyGoal()
        }

        // Load food database
        if let data = userDefaults.data(forKey: "foodDatabase"),
           let foods = try? JSONDecoder().decode([FoodItem].self, from: data) {
            self.foodDatabase = foods
        } else {
            self.foodDatabase = Self.defaultFoodDatabase()
        }

        loadTodayMeals()
        loadTodayWater()
    }

    // MARK: - Save Methods

    func saveProfile() {
        if let data = try? encoder.encode(userProfile) {
            userDefaults.set(data, forKey: "userProfile")
        }
    }

    func saveGoal() {
        if let data = try? encoder.encode(dailyGoal) {
            userDefaults.set(data, forKey: "dailyGoal")
        }
    }

    func saveFoodDatabase() {
        if let data = try? encoder.encode(foodDatabase) {
            userDefaults.set(data, forKey: "foodDatabase")
        }
    }

    // MARK: - Meal Methods

    func addMealEntry(_ entry: MealEntry) {
        mealEntries.append(entry)
        saveMeals()
    }

    func removeMealEntry(_ entry: MealEntry) {
        mealEntries.removeAll { $0.id == entry.id }
        saveMeals()
    }

    func updateMealEntry(_ entry: MealEntry) {
        if let index = mealEntries.firstIndex(where: { $0.id == entry.id }) {
            mealEntries[index] = entry
            saveMeals()
        }
    }

    private func saveMeals() {
        let key = mealsKey(for: Date())
        if let data = try? encoder.encode(mealEntries) {
            userDefaults.set(data, forKey: key)
        }
    }

    func loadTodayMeals() {
        let key = mealsKey(for: Date())
        if let data = userDefaults.data(forKey: key),
           let meals = try? decoder.decode([MealEntry].self, from: data) {
            self.mealEntries = meals
        } else {
            self.mealEntries = []
        }
    }

    func loadMeals(for date: Date) -> [MealEntry] {
        let key = mealsKey(for: date)
        if let data = userDefaults.data(forKey: key),
           let meals = try? decoder.decode([MealEntry].self, from: data) {
            return meals
        }
        return []
    }

    private func mealsKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return "meals_\(formatter.string(from: date))"
    }

    // MARK: - Water

    func addWater(_ amount: Double) {
        waterIntake += amount
        saveTodayWater()
    }

    private func saveTodayWater() {
        let key = waterKey(for: Date())
        userDefaults.set(waterIntake, forKey: key)
    }

    func loadTodayWater() {
        let key = waterKey(for: Date())
        waterIntake = userDefaults.double(forKey: key)
    }

    private func waterKey(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return "water_\(formatter.string(from: date))"
    }

    // MARK: - Food Item Management

    func addFoodItem(_ item: FoodItem) {
        foodDatabase.append(item)
        saveFoodDatabase()
    }

    func toggleFavorite(_ item: FoodItem) {
        if let index = foodDatabase.firstIndex(where: { $0.id == item.id }) {
            foodDatabase[index].isFavorite.toggle()
            saveFoodDatabase()
        }
    }

    // MARK: - Daily Summary

    func todaySummary() -> DailySummary {
        DailySummary(
            id: UUID(),
            date: Date(),
            meals: mealEntries,
            goal: dailyGoal,
            whoopData: whoopHistory.first { Calendar.current.isDateInToday($0.date) },
            waterIntake: waterIntake
        )
    }

    // MARK: - Whoop Data

    func saveWhoopData(_ data: WhoopDailyData) {
        if let index = whoopHistory.firstIndex(where: {
            Calendar.current.isDate($0.date, inSameDayAs: data.date)
        }) {
            whoopHistory[index] = data
        } else {
            whoopHistory.append(data)
        }
        if let encoded = try? encoder.encode(whoopHistory) {
            userDefaults.set(encoded, forKey: "whoopHistory")
        }
    }

    func loadWhoopHistory() {
        if let data = userDefaults.data(forKey: "whoopHistory"),
           let history = try? decoder.decode([WhoopDailyData].self, from: data) {
            self.whoopHistory = history
        }
    }

    // MARK: - Default Food Database (Brazilian foods)

    static func defaultFoodDatabase() -> [FoodItem] {
        [
            // Proteínas
            FoodItem(name: "Peito de Frango Grelhado", calories: 165, protein: 31, carbs: 0, fat: 3.6, category: .protein),
            FoodItem(name: "Ovo Cozido", calories: 155, protein: 13, carbs: 1.1, fat: 11, portionSize: 50, portionUnit: "unidade", category: .protein),
            FoodItem(name: "Patinho (Carne Bovina)", calories: 219, protein: 35.9, carbs: 0, fat: 7.3, category: .protein),
            FoodItem(name: "Filé de Tilápia", calories: 128, protein: 26, carbs: 0, fat: 2.7, category: .protein),
            FoodItem(name: "Salmão Grelhado", calories: 208, protein: 20, carbs: 0, fat: 13, category: .protein),
            FoodItem(name: "Atum em Lata", calories: 116, protein: 25.5, carbs: 0, fat: 1, category: .protein),
            FoodItem(name: "Whey Protein (dose)", calories: 120, protein: 24, carbs: 3, fat: 1.5, portionSize: 30, portionUnit: "g", category: .supplements),

            // Carboidratos
            FoodItem(name: "Arroz Branco Cozido", calories: 130, protein: 2.7, carbs: 28, fat: 0.3, category: .carbs),
            FoodItem(name: "Arroz Integral Cozido", calories: 123, protein: 2.6, carbs: 25.6, fat: 1, fiber: 1.8, category: .carbs),
            FoodItem(name: "Feijão Carioca Cozido", calories: 76, protein: 4.8, carbs: 13.6, fat: 0.5, fiber: 8.5, category: .carbs),
            FoodItem(name: "Batata Doce Cozida", calories: 77, protein: 1.4, carbs: 18.2, fat: 0.1, fiber: 2.5, category: .carbs),
            FoodItem(name: "Macarrão Integral", calories: 124, protein: 5.3, carbs: 26.5, fat: 0.5, fiber: 3.2, category: .carbs),
            FoodItem(name: "Pão Integral (fatia)", calories: 69, protein: 3.5, carbs: 11.6, fat: 1.1, fiber: 1.9, portionSize: 30, portionUnit: "fatia", category: .carbs),
            FoodItem(name: "Aveia em Flocos", calories: 394, protein: 13.9, carbs: 67, fat: 8.5, fiber: 9.1, category: .carbs),
            FoodItem(name: "Tapioca (goma)", calories: 342, protein: 0.5, carbs: 84.9, fat: 0.1, category: .carbs),

            // Vegetais
            FoodItem(name: "Brócolis Cozido", calories: 35, protein: 2.4, carbs: 7, fat: 0.4, fiber: 3.3, category: .vegetables),
            FoodItem(name: "Espinafre Cozido", calories: 23, protein: 2.9, carbs: 3.6, fat: 0.3, fiber: 2.4, category: .vegetables),
            FoodItem(name: "Tomate", calories: 18, protein: 0.9, carbs: 3.9, fat: 0.2, fiber: 1.2, category: .vegetables),
            FoodItem(name: "Alface", calories: 15, protein: 1.4, carbs: 2.9, fat: 0.2, fiber: 1.3, category: .vegetables),
            FoodItem(name: "Cenoura", calories: 41, protein: 0.9, carbs: 10, fat: 0.2, fiber: 2.8, category: .vegetables),
            FoodItem(name: "Abobrinha", calories: 17, protein: 1.2, carbs: 3.1, fat: 0.3, fiber: 1, category: .vegetables),

            // Frutas
            FoodItem(name: "Banana", calories: 89, protein: 1.1, carbs: 23, fat: 0.3, fiber: 2.6, portionSize: 120, portionUnit: "unidade", category: .fruits),
            FoodItem(name: "Maçã", calories: 52, protein: 0.3, carbs: 14, fat: 0.2, fiber: 2.4, portionSize: 150, portionUnit: "unidade", category: .fruits),
            FoodItem(name: "Morango", calories: 32, protein: 0.7, carbs: 7.7, fat: 0.3, fiber: 2, category: .fruits),
            FoodItem(name: "Abacate", calories: 160, protein: 2, carbs: 8.5, fat: 14.7, fiber: 6.7, category: .fruits),
            FoodItem(name: "Manga", calories: 60, protein: 0.8, carbs: 15, fat: 0.4, fiber: 1.6, category: .fruits),

            // Laticínios
            FoodItem(name: "Iogurte Natural", calories: 59, protein: 3.5, carbs: 4.7, fat: 3.3, category: .dairy),
            FoodItem(name: "Queijo Cottage", calories: 98, protein: 11.1, carbs: 3.4, fat: 4.3, category: .dairy),
            FoodItem(name: "Queijo Minas", calories: 264, protein: 17.4, carbs: 3.2, fat: 20.2, category: .dairy),
            FoodItem(name: "Leite Desnatado", calories: 35, protein: 3.4, carbs: 5, fat: 0.1, portionSize: 200, portionUnit: "ml", category: .dairy),

            // Gorduras
            FoodItem(name: "Azeite de Oliva", calories: 884, protein: 0, carbs: 0, fat: 100, portionSize: 15, portionUnit: "ml", category: .fats),
            FoodItem(name: "Castanha do Pará", calories: 656, protein: 14.3, carbs: 12.3, fat: 66.4, fiber: 7.5, portionSize: 10, portionUnit: "g", category: .fats),
            FoodItem(name: "Pasta de Amendoim", calories: 588, protein: 25.1, carbs: 20, fat: 50.4, fiber: 6, portionSize: 20, portionUnit: "g", category: .fats),
        ]
    }
}
