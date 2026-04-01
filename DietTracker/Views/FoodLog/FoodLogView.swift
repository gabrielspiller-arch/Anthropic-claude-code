import SwiftUI

struct FoodLogView: View {
    @EnvironmentObject var persistence: PersistenceController
    @State private var showAddMeal = false
    @State private var selectedMealType: MealType = .lunch
    @State private var selectedDate = Date()

    var meals: [MealEntry] {
        if Calendar.current.isDateInToday(selectedDate) {
            return persistence.mealEntries
        }
        return persistence.loadMeals(for: selectedDate)
    }

    var groupedMeals: [(MealType, [MealEntry])] {
        let grouped = Dictionary(grouping: meals) { $0.mealType }
        return MealType.allCases.compactMap { type in
            guard let entries = grouped[type], !entries.isEmpty else { return nil }
            return (type, entries)
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Date Picker
                DatePicker("Data", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.compact)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .onChange(of: selectedDate) { _, newDate in
                        if Calendar.current.isDateInToday(newDate) {
                            persistence.loadTodayMeals()
                        }
                    }

                // Daily Totals Bar
                dailyTotalsBar

                Divider()

                if groupedMeals.isEmpty {
                    emptyState
                } else {
                    List {
                        ForEach(groupedMeals, id: \.0) { mealType, entries in
                            Section {
                                ForEach(entries) { entry in
                                    MealEntryRow(entry: entry)
                                        .swipeActions(edge: .trailing) {
                                            Button(role: .destructive) {
                                                persistence.removeMealEntry(entry)
                                            } label: {
                                                Label("Excluir", systemImage: "trash")
                                            }
                                        }
                                }
                            } header: {
                                HStack {
                                    Image(systemName: mealType.icon)
                                    Text(mealType.rawValue)
                                    Spacer()
                                    Text("\(Int(entries.reduce(0) { $0 + $1.totalCalories })) kcal")
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Alimentação")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        ForEach(MealType.allCases, id: \.self) { type in
                            Button {
                                selectedMealType = type
                                showAddMeal = true
                            } label: {
                                Label(type.rawValue, systemImage: type.icon)
                            }
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title3)
                    }
                }
            }
            .sheet(isPresented: $showAddMeal) {
                AddMealView(mealType: selectedMealType)
            }
        }
    }

    private var dailyTotalsBar: some View {
        let totalCal = meals.reduce(0) { $0 + $1.totalCalories }
        let totalPro = meals.reduce(0) { $0 + $1.totalProtein }
        let totalCarbs = meals.reduce(0) { $0 + $1.totalCarbs }
        let totalFat = meals.reduce(0) { $0 + $1.totalFat }

        return HStack {
            DailyTotalPill(label: "Cal", value: "\(Int(totalCal))", color: .green)
            DailyTotalPill(label: "Prot", value: "\(Int(totalPro))g", color: .red)
            DailyTotalPill(label: "Carb", value: "\(Int(totalCarbs))g", color: .orange)
            DailyTotalPill(label: "Gord", value: "\(Int(totalFat))g", color: .purple)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }

    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "fork.knife.circle")
                .font(.system(size: 60))
                .foregroundStyle(.secondary)
            Text("Nenhuma refeição registrada")
                .font(.title3)
                .foregroundStyle(.secondary)
            Text("Toque no + para adicionar uma refeição")
                .font(.subheadline)
                .foregroundStyle(.tertiary)

            Button {
                selectedMealType = suggestedMealType
                showAddMeal = true
            } label: {
                Label("Adicionar \(suggestedMealType.rawValue)", systemImage: "plus")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .padding(.horizontal, 40)
            Spacer()
        }
    }

    private var suggestedMealType: MealType {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 5..<10: return .breakfast
        case 10..<12: return .morningSnack
        case 12..<14: return .lunch
        case 14..<17: return .afternoonSnack
        case 17..<21: return .dinner
        default: return .eveningSnack
        }
    }
}

struct MealEntryRow: View {
    let entry: MealEntry

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(entry.foodItem.name)
                    .font(.subheadline)
                    .fontWeight(.medium)

                HStack(spacing: 8) {
                    Text("P:\(Int(entry.totalProtein))g")
                        .foregroundColor(.red)
                    Text("C:\(Int(entry.totalCarbs))g")
                        .foregroundColor(.orange)
                    Text("G:\(Int(entry.totalFat))g")
                        .foregroundColor(.purple)
                }
                .font(.caption2)

                if entry.quantity != 1.0 {
                    Text("\(String(format: "%.1f", entry.quantity))x \(Int(entry.foodItem.portionSize))\(entry.foodItem.portionUnit)")
                        .font(.caption2)
                        .foregroundStyle(.tertiary)
                }
            }

            Spacer()

            Text("\(Int(entry.totalCalories))")
                .font(.system(.body, design: .rounded, weight: .bold))
            Text("kcal")
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 2)
    }
}

struct DailyTotalPill: View {
    let label: String
    let value: String
    let color: Color

    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(.caption, design: .rounded, weight: .bold))
            Text(label)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 6)
        .background(color.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    FoodLogView()
        .environmentObject(PersistenceController.shared)
}
