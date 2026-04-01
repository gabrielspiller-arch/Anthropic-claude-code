import SwiftUI

struct AddMealView: View {
    @EnvironmentObject var persistence: PersistenceController
    @Environment(\.dismiss) var dismiss

    let mealType: MealType

    @State private var searchText = ""
    @State private var selectedCategory: FoodCategory?
    @State private var showCreateFood = false
    @State private var selectedFood: FoodItem?
    @State private var quantity: Double = 1.0
    @State private var notes = ""

    var filteredFoods: [FoodItem] {
        var foods = persistence.foodDatabase

        if let category = selectedCategory {
            foods = foods.filter { $0.category == category }
        }

        if !searchText.isEmpty {
            foods = foods.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }

        // Favoritos primeiro
        return foods.sorted { $0.isFavorite && !$1.isFavorite }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Meal type header
                HStack {
                    Image(systemName: mealType.icon)
                        .foregroundColor(.orange)
                    Text(mealType.rawValue)
                        .font(.headline)
                    Spacer()
                }
                .padding()
                .background(Color(.systemGroupedBackground))

                // Search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.secondary)
                    TextField("Buscar alimento...", text: $searchText)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                .padding(.vertical, 8)

                // Category Filter
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        CategoryChip(title: "Todos", isSelected: selectedCategory == nil) {
                            selectedCategory = nil
                        }
                        ForEach(FoodCategory.allCases, id: \.self) { category in
                            CategoryChip(
                                title: category.rawValue,
                                isSelected: selectedCategory == category
                            ) {
                                selectedCategory = category
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 4)

                Divider()

                // Food List
                if let food = selectedFood {
                    // Quantity selector
                    foodDetailSection(food: food)
                } else {
                    List {
                        ForEach(filteredFoods) { food in
                            FoodItemRow(food: food) {
                                selectedFood = food
                            } onToggleFavorite: {
                                persistence.toggleFavorite(food)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Adicionar Refeição")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showCreateFood = true
                    } label: {
                        Image(systemName: "plus.square")
                    }
                }
            }
            .sheet(isPresented: $showCreateFood) {
                CreateFoodView()
            }
        }
    }

    private func foodDetailSection(food: FoodItem) -> some View {
        VStack(spacing: 20) {
            Spacer()

            // Food info card
            VStack(spacing: 8) {
                Text(food.name)
                    .font(.title3)
                    .fontWeight(.bold)

                Text("\(Int(food.portionSize))\(food.portionUnit) por porção")
                    .font(.caption)
                    .foregroundStyle(.secondary)

                // Macros per portion
                HStack(spacing: 20) {
                    NutrientLabel(name: "Cal", value: "\(Int(food.calories * quantity))", color: .green)
                    NutrientLabel(name: "Prot", value: "\(Int(food.protein * quantity))g", color: .red)
                    NutrientLabel(name: "Carb", value: "\(Int(food.carbs * quantity))g", color: .orange)
                    NutrientLabel(name: "Gord", value: "\(Int(food.fat * quantity))g", color: .purple)
                }
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .padding(.horizontal)

            // Quantity selector
            VStack(spacing: 8) {
                Text("Quantidade (porções)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                HStack(spacing: 20) {
                    Button {
                        if quantity > 0.25 { quantity -= 0.25 }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                    }

                    Text(String(format: "%.2f", quantity))
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .frame(width: 100)

                    Button {
                        quantity += 0.25
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(.green)
                    }
                }

                // Quick quantity buttons
                HStack(spacing: 8) {
                    ForEach([0.5, 1.0, 1.5, 2.0], id: \.self) { q in
                        Button {
                            quantity = q
                        } label: {
                            Text(q == 1.0 || q == 2.0 ? "\(Int(q))" : String(format: "%.1f", q))
                                .font(.caption)
                                .fontWeight(.medium)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(quantity == q ? Color.green : Color(.systemGray5))
                                .foregroundColor(quantity == q ? .white : .primary)
                                .clipShape(Capsule())
                        }
                    }
                }
            }

            // Notes
            TextField("Observações (opcional)", text: $notes)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            Spacer()

            // Add button
            HStack {
                Button {
                    selectedFood = nil
                    quantity = 1.0
                } label: {
                    Text("Voltar")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(.systemGray5))
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }

                Button {
                    let entry = MealEntry(
                        foodItem: food,
                        quantity: quantity,
                        mealType: mealType,
                        notes: notes
                    )
                    persistence.addMealEntry(entry)
                    dismiss()
                } label: {
                    Text("Adicionar")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct FoodItemRow: View {
    let food: FoodItem
    let onSelect: () -> Void
    let onToggleFavorite: () -> Void

    var body: some View {
        Button(action: onSelect) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        if food.isFavorite {
                            Image(systemName: "star.fill")
                                .font(.caption2)
                                .foregroundColor(.yellow)
                        }
                        Text(food.name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.primary)
                    }

                    HStack(spacing: 6) {
                        Text("P:\(Int(food.protein))g")
                            .foregroundColor(.red)
                        Text("C:\(Int(food.carbs))g")
                            .foregroundColor(.orange)
                        Text("G:\(Int(food.fat))g")
                            .foregroundColor(.purple)
                    }
                    .font(.caption2)
                }

                Spacer()

                VStack(alignment: .trailing) {
                    Text("\(Int(food.calories))")
                        .font(.system(.body, design: .rounded, weight: .bold))
                    Text("kcal/\(Int(food.portionSize))\(food.portionUnit)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .swipeActions(edge: .leading) {
            Button {
                onToggleFavorite()
            } label: {
                Label("Favorito", systemImage: food.isFavorite ? "star.slash" : "star.fill")
            }
            .tint(.yellow)
        }
    }
}

struct CategoryChip: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.green : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .clipShape(Capsule())
        }
    }
}

struct NutrientLabel: View {
    let name: String
    let value: String
    let color: Color

    var body: some View {
        VStack(spacing: 2) {
            Text(value)
                .font(.system(.subheadline, design: .rounded, weight: .bold))
                .foregroundColor(color)
            Text(name)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    AddMealView(mealType: .lunch)
        .environmentObject(PersistenceController.shared)
}
