import Foundation

struct DailyGoal: Identifiable, Codable {
    let id: UUID
    var calorieTarget: Double        // kcal objetivo de consumo
    var calorieBurnTarget: Double    // kcal objetivo de gasto
    var proteinTarget: Double        // gramas
    var carbsTarget: Double          // gramas
    var fatTarget: Double            // gramas
    var fiberTarget: Double          // gramas
    var waterTarget: Double          // litros
    var date: Date

    init(
        id: UUID = UUID(),
        calorieTarget: Double = 2000,
        calorieBurnTarget: Double = 2500,
        proteinTarget: Double = 150,
        carbsTarget: Double = 200,
        fatTarget: Double = 70,
        fiberTarget: Double = 30,
        waterTarget: Double = 3.0,
        date: Date = Date()
    ) {
        self.id = id
        self.calorieTarget = calorieTarget
        self.calorieBurnTarget = calorieBurnTarget
        self.proteinTarget = proteinTarget
        self.carbsTarget = carbsTarget
        self.fatTarget = fatTarget
        self.fiberTarget = fiberTarget
        self.waterTarget = waterTarget
        self.date = date
    }

    var deficit: Double {
        calorieBurnTarget - calorieTarget
    }
}

struct DailySummary: Identifiable {
    let id: UUID
    let date: Date
    var meals: [MealEntry]
    var goal: DailyGoal
    var whoopData: WhoopDailyData?
    var waterIntake: Double // litros

    var totalCaloriesConsumed: Double {
        meals.reduce(0) { $0 + $1.totalCalories }
    }

    var totalProtein: Double {
        meals.reduce(0) { $0 + $1.totalProtein }
    }

    var totalCarbs: Double {
        meals.reduce(0) { $0 + $1.totalCarbs }
    }

    var totalFat: Double {
        meals.reduce(0) { $0 + $1.totalFat }
    }

    var totalFiber: Double {
        meals.reduce(0) { $0 + $1.totalFiber }
    }

    var caloriesRemaining: Double {
        goal.calorieTarget - totalCaloriesConsumed
    }

    var caloriesBurnedFromWhoop: Double {
        whoopData?.totalCaloriesBurned ?? 0
    }

    var actualDeficit: Double {
        caloriesBurnedFromWhoop - totalCaloriesConsumed
    }

    var calorieProgress: Double {
        guard goal.calorieTarget > 0 else { return 0 }
        return min(totalCaloriesConsumed / goal.calorieTarget, 1.5)
    }

    var proteinProgress: Double {
        guard goal.proteinTarget > 0 else { return 0 }
        return min(totalProtein / goal.proteinTarget, 1.5)
    }

    var carbsProgress: Double {
        guard goal.carbsTarget > 0 else { return 0 }
        return min(totalCarbs / goal.carbsTarget, 1.5)
    }

    var fatProgress: Double {
        guard goal.fatTarget > 0 else { return 0 }
        return min(totalFat / goal.fatTarget, 1.5)
    }

    var waterProgress: Double {
        guard goal.waterTarget > 0 else { return 0 }
        return min(waterIntake / goal.waterTarget, 1.5)
    }
}
