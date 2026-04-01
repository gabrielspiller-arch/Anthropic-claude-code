import SwiftUI

struct GoalsView: View {
    @EnvironmentObject var persistence: PersistenceController
    @EnvironmentObject var whoopService: WhoopService
    @State private var showEditGoal = false

    var summary: DailySummary {
        persistence.todaySummary()
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Calorie Budget Card
                    calorieBudgetCard

                    // Burn Goal Card
                    burnGoalCard

                    // Macro Goals
                    macroGoalsCard

                    // Suggested Adjustments
                    suggestionsCard

                    // Weekly Overview
                    weeklyOverviewCard
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Metas Diárias")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showEditGoal = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            .sheet(isPresented: $showEditGoal) {
                EditGoalView()
            }
        }
    }

    // MARK: - Calorie Budget

    private var calorieBudgetCard: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Orçamento Calórico")
                    .font(.headline)
                Spacer()
                Text(persistence.userProfile.dietGoal.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.15))
                    .clipShape(Capsule())
            }

            // Visual budget bar
            VStack(spacing: 8) {
                GeometryReader { geo in
                    let width = geo.size.width
                    let consumed = summary.totalCaloriesConsumed
                    let target = summary.goal.calorieTarget
                    let ratio = min(consumed / target, 1.5)

                    ZStack(alignment: .leading) {
                        // Background
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray5))
                            .frame(height: 32)

                        // Target marker
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(.systemGray3))
                            .frame(width: width * (1.0 / 1.5), height: 32)

                        // Consumed
                        RoundedRectangle(cornerRadius: 8)
                            .fill(ratio > 1.0 ? Color.red : Color.green)
                            .frame(width: width * (ratio / 1.5), height: 32)

                        // Label
                        Text("\(Int(consumed)) / \(Int(target)) kcal")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                    }
                }
                .frame(height: 32)

                HStack {
                    Label("Consumido: \(Int(summary.totalCaloriesConsumed))", systemImage: "fork.knife")
                        .font(.caption)
                    Spacer()
                    Label("Meta: \(Int(summary.goal.calorieTarget))", systemImage: "target")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            // Remaining
            HStack {
                if summary.caloriesRemaining > 0 {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("Ainda pode consumir \(Int(summary.caloriesRemaining)) kcal")
                        .font(.subheadline)
                } else {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .foregroundColor(.red)
                    Text("Excedeu \(Int(abs(summary.caloriesRemaining))) kcal da meta")
                        .font(.subheadline)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Burn Goal

    private var burnGoalCard: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Meta de Gasto Calórico")
                    .font(.headline)
                Spacer()
                Image(systemName: "flame.fill")
                    .foregroundColor(.orange)
            }

            let burned = whoopService.todayData?.totalCaloriesBurned ?? 0
            let burnTarget = summary.goal.calorieBurnTarget
            let burnProgress = burnTarget > 0 ? min(burned / burnTarget, 1.0) : 0

            HStack(spacing: 20) {
                // Burn ring
                ZStack {
                    Circle()
                        .stroke(Color.orange.opacity(0.2), lineWidth: 12)
                        .frame(width: 100, height: 100)

                    Circle()
                        .trim(from: 0, to: burnProgress)
                        .stroke(Color.orange, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .frame(width: 100, height: 100)
                        .rotationEffect(.degrees(-90))

                    VStack {
                        Text("\(Int(burned))")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                        Text("kcal")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text("Meta:")
                        Spacer()
                        Text("\(Int(burnTarget)) kcal")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)

                    HStack {
                        Text("Gasto:")
                        Spacer()
                        Text("\(Int(burned)) kcal")
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                    }
                    .font(.subheadline)

                    Divider()

                    HStack {
                        Text("Déficit real:")
                        Spacer()
                        let deficit = burned - summary.totalCaloriesConsumed
                        Text("\(Int(deficit)) kcal")
                            .fontWeight(.bold)
                            .foregroundColor(deficit >= 0 ? .green : .red)
                    }
                    .font(.subheadline)

                    if !whoopService.isConnected {
                        Text("Conecte o Whoop para dados reais")
                            .font(.caption2)
                            .foregroundColor(.orange)
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Macro Goals

    private var macroGoalsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Macronutrientes")
                .font(.headline)

            MacroGoalRow(name: "Proteína", current: summary.totalProtein, target: summary.goal.proteinTarget, unit: "g", color: .red)
            MacroGoalRow(name: "Carboidratos", current: summary.totalCarbs, target: summary.goal.carbsTarget, unit: "g", color: .orange)
            MacroGoalRow(name: "Gorduras", current: summary.totalFat, target: summary.goal.fatTarget, unit: "g", color: .purple)
            MacroGoalRow(name: "Fibras", current: summary.totalFiber, target: summary.goal.fiberTarget, unit: "g", color: .green)
            MacroGoalRow(name: "Água", current: persistence.waterIntake, target: summary.goal.waterTarget, unit: "L", color: .blue)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Suggestions

    private var suggestionsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Sugestões")
                .font(.headline)

            ForEach(generateSuggestions(), id: \.self) { suggestion in
                HStack(alignment: .top) {
                    Image(systemName: "lightbulb.fill")
                        .foregroundColor(.yellow)
                        .font(.caption)
                    Text(suggestion)
                        .font(.caption)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    private func generateSuggestions() -> [String] {
        var suggestions: [String] = []

        if summary.totalProtein < summary.goal.proteinTarget * 0.5 {
            suggestions.append("Considere adicionar mais proteína nas próximas refeições. Opções: frango, peixe, ovos ou whey.")
        }

        if summary.caloriesRemaining < 0 {
            suggestions.append("Você excedeu a meta calórica. Considere uma atividade extra para compensar.")
        }

        if summary.caloriesRemaining > summary.goal.calorieTarget * 0.5 && Calendar.current.component(.hour, from: Date()) > 16 {
            suggestions.append("Ainda restam muitas calorias. Não pule refeições - distribua ao longo das próximas refeições.")
        }

        if persistence.waterIntake < summary.goal.waterTarget * 0.5 {
            suggestions.append("Hidratação baixa! Beba pelo menos mais \(String(format: "%.1f", summary.goal.waterTarget - persistence.waterIntake))L de água hoje.")
        }

        if summary.totalFiber < summary.goal.fiberTarget * 0.3 {
            suggestions.append("Fibra baixa. Adicione vegetais, frutas ou aveia às próximas refeições.")
        }

        if suggestions.isEmpty {
            suggestions.append("Você está no caminho certo! Continue assim.")
        }

        return suggestions
    }

    // MARK: - Weekly Overview

    private var weeklyOverviewCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Últimos 7 dias")
                .font(.headline)

            HStack(spacing: 4) {
                ForEach(0..<7, id: \.self) { dayOffset in
                    let date = Calendar.current.date(byAdding: .day, value: -6 + dayOffset, to: Date())!
                    let meals = persistence.loadMeals(for: date)
                    let total = meals.reduce(0.0) { $0 + $1.totalCalories }
                    let target = persistence.dailyGoal.calorieTarget
                    let ratio = target > 0 ? total / target : 0

                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(barColor(ratio: ratio))
                            .frame(width: 30, height: max(8, CGFloat(min(ratio, 1.5)) * 60))

                        Text(dayLabel(date))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 110, alignment: .bottom)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    private func barColor(ratio: Double) -> Color {
        switch ratio {
        case 0: return .gray.opacity(0.3)
        case ..<0.8: return .orange
        case 0.8...1.1: return .green
        default: return .red
        }
    }

    private func dayLabel(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter.string(from: date).prefix(3).capitalized
    }
}

struct MacroGoalRow: View {
    let name: String
    let current: Double
    let target: Double
    let unit: String
    let color: Color

    var progress: Double {
        guard target > 0 else { return 0 }
        return min(current / target, 1.0)
    }

    var body: some View {
        VStack(spacing: 4) {
            HStack {
                Text(name)
                    .font(.subheadline)
                Spacer()
                Text("\(String(format: unit == "L" ? "%.1f" : "%.0f", current)) / \(String(format: unit == "L" ? "%.1f" : "%.0f", target)) \(unit)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            ProgressView(value: progress, total: 1.0)
                .tint(color)
        }
    }
}

#Preview {
    GoalsView()
        .environmentObject(PersistenceController.shared)
        .environmentObject(WhoopService.shared)
}
