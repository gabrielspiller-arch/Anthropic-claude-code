import SwiftUI

struct CreateFoodView: View {
    @EnvironmentObject var persistence: PersistenceController
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var calories = ""
    @State private var protein = ""
    @State private var carbs = ""
    @State private var fat = ""
    @State private var fiber = ""
    @State private var portionSize = "100"
    @State private var portionUnit = "g"
    @State private var category: FoodCategory = .other

    private let portionUnits = ["g", "ml", "unidade", "fatia", "colher", "xícara"]

    var isValid: Bool {
        !name.isEmpty && Double(calories) != nil
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Informações Básicas") {
                    TextField("Nome do alimento", text: $name)

                    Picker("Categoria", selection: $category) {
                        ForEach(FoodCategory.allCases, id: \.self) { cat in
                            Text(cat.rawValue).tag(cat)
                        }
                    }
                }

                Section("Porção") {
                    HStack {
                        TextField("Tamanho", text: $portionSize)
                            .keyboardType(.decimalPad)
                        Picker("Unidade", selection: $portionUnit) {
                            ForEach(portionUnits, id: \.self) { unit in
                                Text(unit).tag(unit)
                            }
                        }
                    }
                }

                Section("Valores Nutricionais (por porção)") {
                    NutrientField(label: "Calorias (kcal)", value: $calories, color: .green)
                    NutrientField(label: "Proteínas (g)", value: $protein, color: .red)
                    NutrientField(label: "Carboidratos (g)", value: $carbs, color: .orange)
                    NutrientField(label: "Gorduras (g)", value: $fat, color: .purple)
                    NutrientField(label: "Fibras (g)", value: $fiber, color: .green)
                }

                if isValid {
                    Section("Resumo") {
                        HStack {
                            NutrientLabel(name: "Cal", value: calories, color: .green)
                            NutrientLabel(name: "Prot", value: "\(protein)g", color: .red)
                            NutrientLabel(name: "Carb", value: "\(carbs)g", color: .orange)
                            NutrientLabel(name: "Gord", value: "\(fat)g", color: .purple)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Novo Alimento")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        saveFoodItem()
                    }
                    .disabled(!isValid)
                }
            }
        }
    }

    private func saveFoodItem() {
        let food = FoodItem(
            name: name,
            calories: Double(calories) ?? 0,
            protein: Double(protein) ?? 0,
            carbs: Double(carbs) ?? 0,
            fat: Double(fat) ?? 0,
            fiber: Double(fiber) ?? 0,
            portionSize: Double(portionSize) ?? 100,
            portionUnit: portionUnit,
            category: category
        )
        persistence.addFoodItem(food)
        dismiss()
    }
}

struct NutrientField: View {
    let label: String
    @Binding var value: String
    let color: Color

    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
            Text(label)
            Spacer()
            TextField("0", text: $value)
                .keyboardType(.decimalPad)
                .multilineTextAlignment(.trailing)
                .frame(width: 80)
        }
    }
}

#Preview {
    CreateFoodView()
        .environmentObject(PersistenceController.shared)
}
