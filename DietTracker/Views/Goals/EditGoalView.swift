import SwiftUI

struct EditGoalView: View {
    @EnvironmentObject var persistence: PersistenceController
    @Environment(\.dismiss) var dismiss

    @State private var calorieTarget: Double
    @State private var calorieBurnTarget: Double
    @State private var proteinTarget: Double
    @State private var carbsTarget: Double
    @State private var fatTarget: Double
    @State private var fiberTarget: Double
    @State private var waterTarget: Double
    @State private var useSuggested = false

    init() {
        let goal = PersistenceController.shared.dailyGoal
        _calorieTarget = State(initialValue: goal.calorieTarget)
        _calorieBurnTarget = State(initialValue: goal.calorieBurnTarget)
        _proteinTarget = State(initialValue: goal.proteinTarget)
        _carbsTarget = State(initialValue: goal.carbsTarget)
        _fatTarget = State(initialValue: goal.fatTarget)
        _fiberTarget = State(initialValue: goal.fiberTarget)
        _waterTarget = State(initialValue: goal.waterTarget)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Usar valores sugeridos (TDEE)", isOn: $useSuggested)
                        .onChange(of: useSuggested) { _, newValue in
                            if newValue {
                                applySuggestedValues()
                            }
                        }

                    if useSuggested {
                        HStack {
                            Text("TDEE estimado")
                            Spacer()
                            Text("\(Int(persistence.userProfile.tdee)) kcal")
                                .foregroundStyle(.secondary)
                        }
                        HStack {
                            Text("Objetivo")
                            Spacer()
                            Text(persistence.userProfile.dietGoal.rawValue)
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Cálculo Automático")
                }

                Section {
                    GoalSlider(title: "Meta de Consumo", value: $calorieTarget, range: 1000...4000, step: 50, unit: "kcal", color: .green)
                    GoalSlider(title: "Meta de Gasto", value: $calorieBurnTarget, range: 1500...5000, step: 50, unit: "kcal", color: .orange)

                    HStack {
                        Text("Déficit/Superávit planejado")
                            .font(.subheadline)
                        Spacer()
                        let diff = calorieBurnTarget - calorieTarget
                        Text("\(Int(diff)) kcal")
                            .fontWeight(.bold)
                            .foregroundColor(diff > 0 ? .green : .red)
                    }
                } header: {
                    Text("Calorias")
                }

                Section {
                    GoalSlider(title: "Proteína", value: $proteinTarget, range: 50...300, step: 5, unit: "g", color: .red)
                    GoalSlider(title: "Carboidratos", value: $carbsTarget, range: 50...500, step: 10, unit: "g", color: .orange)
                    GoalSlider(title: "Gorduras", value: $fatTarget, range: 20...200, step: 5, unit: "g", color: .purple)
                    GoalSlider(title: "Fibras", value: $fiberTarget, range: 10...60, step: 5, unit: "g", color: .green)

                    // Macro calorie verification
                    let macroCalories = (proteinTarget * 4) + (carbsTarget * 4) + (fatTarget * 9)
                    HStack {
                        Text("Calorias dos macros")
                            .font(.caption)
                        Spacer()
                        Text("\(Int(macroCalories)) kcal")
                            .font(.caption)
                            .foregroundColor(abs(macroCalories - calorieTarget) < 100 ? .green : .orange)
                    }
                } header: {
                    Text("Macronutrientes")
                }

                Section {
                    GoalSlider(title: "Água", value: $waterTarget, range: 1...6, step: 0.5, unit: "L", color: .blue)
                } header: {
                    Text("Hidratação")
                }
            }
            .navigationTitle("Editar Metas")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        saveGoals()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }

    private func applySuggestedValues() {
        let profile = persistence.userProfile
        calorieTarget = profile.suggestedCalorieTarget
        calorieBurnTarget = profile.tdee

        // Macro distribution based on goal
        switch profile.dietGoal {
        case .lose:
            proteinTarget = profile.weight * 2.0  // High protein for cutting
            fatTarget = profile.weight * 0.8
            let remainingCals = calorieTarget - (proteinTarget * 4) - (fatTarget * 9)
            carbsTarget = max(remainingCals / 4, 50)
        case .maintain:
            proteinTarget = profile.weight * 1.6
            fatTarget = profile.weight * 1.0
            let remainingCals = calorieTarget - (proteinTarget * 4) - (fatTarget * 9)
            carbsTarget = max(remainingCals / 4, 100)
        case .gain:
            proteinTarget = profile.weight * 1.8
            fatTarget = profile.weight * 1.0
            let remainingCals = calorieTarget - (proteinTarget * 4) - (fatTarget * 9)
            carbsTarget = max(remainingCals / 4, 150)
        }
    }

    private func saveGoals() {
        persistence.dailyGoal = DailyGoal(
            calorieTarget: calorieTarget,
            calorieBurnTarget: calorieBurnTarget,
            proteinTarget: proteinTarget,
            carbsTarget: carbsTarget,
            fatTarget: fatTarget,
            fiberTarget: fiberTarget,
            waterTarget: waterTarget
        )
        persistence.saveGoal()

        // Update notifications with new goals
        NotificationService.shared.scheduleAllNotifications(
            profile: persistence.userProfile,
            goal: persistence.dailyGoal
        )

        dismiss()
    }
}

struct GoalSlider: View {
    let title: String
    @Binding var value: Double
    let range: ClosedRange<Double>
    let step: Double
    let unit: String
    let color: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(title)
                    .font(.subheadline)
                Spacer()
                Text("\(unit == "L" ? String(format: "%.1f", value) : "\(Int(value))") \(unit)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(color)
            }

            Slider(value: $value, in: range, step: step)
                .tint(color)
        }
    }
}

#Preview {
    EditGoalView()
        .environmentObject(PersistenceController.shared)
}
