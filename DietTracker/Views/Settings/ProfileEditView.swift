import SwiftUI

struct ProfileEditView: View {
    @EnvironmentObject var persistence: PersistenceController
    @Environment(\.dismiss) var dismiss

    @State private var name: String
    @State private var age: Double
    @State private var weight: Double
    @State private var height: Double
    @State private var gender: Gender
    @State private var activityLevel: ActivityLevel
    @State private var dietGoal: DietGoal

    init() {
        let profile = PersistenceController.shared.userProfile
        _name = State(initialValue: profile.name)
        _age = State(initialValue: Double(profile.age))
        _weight = State(initialValue: profile.weight)
        _height = State(initialValue: profile.height)
        _gender = State(initialValue: profile.gender)
        _activityLevel = State(initialValue: profile.activityLevel)
        _dietGoal = State(initialValue: profile.dietGoal)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Dados Pessoais") {
                    TextField("Nome", text: $name)

                    Picker("Sexo", selection: $gender) {
                        ForEach(Gender.allCases, id: \.self) { g in
                            Text(g.rawValue).tag(g)
                        }
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Idade")
                            Spacer()
                            Text("\(Int(age)) anos")
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $age, in: 15...80, step: 1)
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Peso")
                            Spacer()
                            Text(String(format: "%.1f kg", weight))
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $weight, in: 40...200, step: 0.5)
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text("Altura")
                            Spacer()
                            Text("\(Int(height)) cm")
                                .foregroundStyle(.secondary)
                        }
                        Slider(value: $height, in: 140...220, step: 1)
                    }
                }

                Section("Nível de Atividade") {
                    Picker("Atividade", selection: $activityLevel) {
                        ForEach(ActivityLevel.allCases, id: \.self) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                    .pickerStyle(.menu)

                    HStack {
                        Text("Multiplicador")
                        Spacer()
                        Text("x\(String(format: "%.3f", activityLevel.multiplier))")
                            .foregroundStyle(.secondary)
                    }
                }

                Section("Objetivo") {
                    Picker("Objetivo", selection: $dietGoal) {
                        ForEach(DietGoal.allCases, id: \.self) { goal in
                            Label(goal.rawValue, systemImage: goal.icon).tag(goal)
                        }
                    }
                    .pickerStyle(.segmented)
                }

                Section("Estimativas") {
                    let bmr = calculateBMR()
                    let tdee = bmr * activityLevel.multiplier

                    HStack {
                        Text("TMB")
                        Spacer()
                        Text("\(Int(bmr)) kcal")
                            .fontWeight(.medium)
                    }

                    HStack {
                        Text("TDEE")
                        Spacer()
                        Text("\(Int(tdee)) kcal")
                            .fontWeight(.medium)
                    }

                    HStack {
                        Text("Meta sugerida")
                        Spacer()
                        let suggested: Double
                        switch dietGoal {
                        case .lose: suggested = tdee - 500
                        case .maintain: suggested = tdee
                        case .gain: suggested = tdee + 300
                        }
                        Text("\(Int(suggested)) kcal")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                    }
                }
            }
            .navigationTitle("Perfil")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        saveProfile()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }

    private func calculateBMR() -> Double {
        switch gender {
        case .male:
            return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age)
        case .female:
            return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age)
        }
    }

    private func saveProfile() {
        persistence.userProfile = UserProfile(
            name: name,
            age: Int(age),
            weight: weight,
            height: height,
            gender: gender,
            activityLevel: activityLevel,
            dietGoal: dietGoal,
            whoopConnected: persistence.userProfile.whoopConnected,
            notificationsEnabled: persistence.userProfile.notificationsEnabled,
            notificationTimes: persistence.userProfile.notificationTimes
        )
        persistence.saveProfile()
        dismiss()
    }
}

#Preview {
    ProfileEditView()
        .environmentObject(PersistenceController.shared)
}
