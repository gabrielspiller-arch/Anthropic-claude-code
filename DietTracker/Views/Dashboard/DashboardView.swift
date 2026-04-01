import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var persistence: PersistenceController
    @EnvironmentObject var whoopService: WhoopService

    var summary: DailySummary {
        persistence.todaySummary()
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Header com data
                    dateHeader

                    // Calorie Ring
                    calorieRingSection

                    // Macros Progress
                    macrosSection

                    // Whoop Summary (se conectado)
                    if whoopService.isConnected {
                        whoopSummarySection
                    }

                    // Água
                    waterSection

                    // Refeições do dia
                    mealsOverview
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Dashboard")
            .refreshable {
                if whoopService.isConnected {
                    await whoopService.fetchTodayData()
                }
                persistence.loadTodayMeals()
                persistence.loadTodayWater()
            }
        }
    }

    // MARK: - Date Header

    private var dateHeader: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(Date(), style: .date)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text(greetingMessage)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
            if whoopService.isConnected, let data = whoopService.todayData {
                VStack {
                    Text("Recovery")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                    Text("\(Int(data.recoveryScore))%")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(recoveryColor(data.recoveryScore))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(recoveryColor(data.recoveryScore).opacity(0.15))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            }
        }
    }

    private var greetingMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<12: return "Bom dia!"
        case 12..<18: return "Boa tarde!"
        default: return "Boa noite!"
        }
    }

    // MARK: - Calorie Ring

    private var calorieRingSection: some View {
        VStack(spacing: 12) {
            ZStack {
                // Background ring
                Circle()
                    .stroke(Color.green.opacity(0.2), lineWidth: 20)
                    .frame(width: 180, height: 180)

                // Progress ring
                Circle()
                    .trim(from: 0, to: min(summary.calorieProgress, 1.0))
                    .stroke(
                        summary.calorieProgress > 1.0 ? Color.red : Color.green,
                        style: StrokeStyle(lineWidth: 20, lineCap: .round)
                    )
                    .frame(width: 180, height: 180)
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut(duration: 0.8), value: summary.calorieProgress)

                VStack(spacing: 4) {
                    Text("\(Int(summary.totalCaloriesConsumed))")
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                    Text("de \(Int(summary.goal.calorieTarget)) kcal")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    if summary.caloriesRemaining > 0 {
                        Text("Restam \(Int(summary.caloriesRemaining))")
                            .font(.caption2)
                            .foregroundColor(.green)
                    } else {
                        Text("Excedeu \(Int(abs(summary.caloriesRemaining)))")
                            .font(.caption2)
                            .foregroundColor(.red)
                    }
                }
            }

            // Burn vs Consume
            if whoopService.isConnected, let whoopData = whoopService.todayData {
                HStack(spacing: 24) {
                    VStack {
                        Label("\(Int(summary.totalCaloriesConsumed))", systemImage: "fork.knife")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Consumido")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }

                    VStack {
                        Label("\(Int(whoopData.totalCaloriesBurned))", systemImage: "flame.fill")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        Text("Gasto (Whoop)")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }

                    VStack {
                        let deficit = whoopData.totalCaloriesBurned - summary.totalCaloriesConsumed
                        Label("\(Int(deficit))", systemImage: deficit >= 0 ? "arrow.down.circle" : "arrow.up.circle")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(deficit >= 0 ? .blue : .red)
                        Text(deficit >= 0 ? "Déficit" : "Superávit")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                .padding()
                .background(Color(.systemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: .black.opacity(0.05), radius: 5)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Macros

    private var macrosSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Macronutrientes")
                .font(.headline)

            HStack(spacing: 16) {
                MacroProgressView(
                    title: "Proteína",
                    current: summary.totalProtein,
                    target: summary.goal.proteinTarget,
                    unit: "g",
                    color: .red
                )

                MacroProgressView(
                    title: "Carbos",
                    current: summary.totalCarbs,
                    target: summary.goal.carbsTarget,
                    unit: "g",
                    color: .orange
                )

                MacroProgressView(
                    title: "Gordura",
                    current: summary.totalFat,
                    target: summary.goal.fatTarget,
                    unit: "g",
                    color: .purple
                )

                MacroProgressView(
                    title: "Fibra",
                    current: summary.totalFiber,
                    target: summary.goal.fiberTarget,
                    unit: "g",
                    color: .green
                )
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Whoop Summary

    private var whoopSummarySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Whoop")
                    .font(.headline)
                Spacer()
                if let lastSync = whoopService.lastSyncDate {
                    Text("Sync: \(lastSync, style: .time)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }

            if let data = whoopService.todayData {
                HStack(spacing: 16) {
                    WhoopStatCard(title: "Strain", value: String(format: "%.1f", data.strain), subtitle: data.strainLevel, color: .orange)
                    WhoopStatCard(title: "Calorias", value: "\(Int(data.totalCaloriesBurned))", subtitle: "kcal", color: .red)
                    WhoopStatCard(title: "Sono", value: String(format: "%.1f", data.sleepHours), subtitle: "horas", color: .blue)
                    WhoopStatCard(title: "HRV", value: "\(Int(data.hrv))", subtitle: "ms", color: .green)
                }

                if !data.activities.isEmpty {
                    Divider()
                    Text("Atividades Hoje")
                        .font(.subheadline)
                        .fontWeight(.medium)
                    ForEach(data.activities) { activity in
                        HStack {
                            Image(systemName: "figure.run")
                                .foregroundColor(.orange)
                            Text(activity.name)
                                .font(.subheadline)
                            Spacer()
                            Text("\(Int(activity.calories)) kcal")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            } else {
                Text("Carregando dados...")
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Water

    private var waterSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Água")
                    .font(.headline)
                Spacer()
                Text(String(format: "%.1f / %.1f L", summary.waterIntake, summary.goal.waterTarget))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            ProgressView(value: summary.waterProgress, total: 1.0)
                .tint(.blue)

            HStack(spacing: 12) {
                ForEach([0.25, 0.5, 0.75, 1.0], id: \.self) { amount in
                    Button {
                        persistence.addWater(amount)
                    } label: {
                        Text("+\(amount == 1.0 ? "1" : String(format: "%.0f", amount * 1000))ml")
                            .font(.caption)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.blue.opacity(0.15))
                            .clipShape(Capsule())
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Meals Overview

    private var mealsOverview: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Refeições de Hoje")
                .font(.headline)

            if summary.meals.isEmpty {
                HStack {
                    Spacer()
                    VStack(spacing: 8) {
                        Image(systemName: "fork.knife.circle")
                            .font(.largeTitle)
                            .foregroundStyle(.secondary)
                        Text("Nenhuma refeição registrada")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    Spacer()
                }
                .padding(.vertical)
            } else {
                let grouped = Dictionary(grouping: summary.meals) { $0.mealType }
                let sortedTypes = grouped.keys.sorted { $0.sortOrder < $1.sortOrder }

                ForEach(sortedTypes, id: \.self) { mealType in
                    if let meals = grouped[mealType] {
                        VStack(alignment: .leading, spacing: 6) {
                            HStack {
                                Image(systemName: mealType.icon)
                                    .foregroundColor(.orange)
                                Text(mealType.rawValue)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                Spacer()
                                Text("\(Int(meals.reduce(0) { $0 + $1.totalCalories })) kcal")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            ForEach(meals) { meal in
                                HStack {
                                    Text(meal.foodItem.name)
                                        .font(.caption)
                                    Spacer()
                                    Text("\(Int(meal.totalCalories)) kcal")
                                        .font(.caption2)
                                        .foregroundStyle(.secondary)
                                }
                                .padding(.leading, 28)
                            }
                        }
                        if mealType != sortedTypes.last {
                            Divider()
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Helpers

    private func recoveryColor(_ score: Double) -> Color {
        switch score {
        case 67...100: return .green
        case 34...66: return .yellow
        default: return .red
        }
    }
}

// MARK: - Subviews

struct MacroProgressView: View {
    let title: String
    let current: Double
    let target: Double
    let unit: String
    let color: Color

    var progress: Double {
        guard target > 0 else { return 0 }
        return min(current / target, 1.0)
    }

    var body: some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .stroke(color.opacity(0.2), lineWidth: 6)
                    .frame(width: 50, height: 50)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(color, style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .frame(width: 50, height: 50)
                    .rotationEffect(.degrees(-90))

                Text("\(Int(current))")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
            }

            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)

            Text("\(Int(target))\(unit)")
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
    }
}

struct WhoopStatCard: View {
    let title: String
    let value: String
    let subtitle: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.system(.body, design: .rounded, weight: .bold))
                .foregroundColor(color)
            Text(subtitle)
                .font(.caption2)
                .foregroundStyle(.tertiary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DashboardView()
        .environmentObject(PersistenceController.shared)
        .environmentObject(WhoopService.shared)
}
