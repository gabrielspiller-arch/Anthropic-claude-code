import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var persistence: PersistenceController
    @EnvironmentObject var notificationService: NotificationService
    @EnvironmentObject var whoopService: WhoopService
    @State private var showProfileEdit = false
    @State private var showNotificationSettings = false
    @State private var showResetAlert = false

    var body: some View {
        NavigationStack {
            List {
                // Profile Section
                Section {
                    Button {
                        showProfileEdit = true
                    } label: {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .font(.title)
                                .foregroundColor(.green)

                            VStack(alignment: .leading, spacing: 2) {
                                Text(persistence.userProfile.name.isEmpty ? "Configurar Perfil" : persistence.userProfile.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text("\(Int(persistence.userProfile.weight))kg | \(Int(persistence.userProfile.height))cm | \(persistence.userProfile.age) anos")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }

                            Spacer()

                            Image(systemName: "chevron.right")
                                .foregroundStyle(.tertiary)
                        }
                    }
                } header: {
                    Text("Perfil")
                }

                // Stats Section
                Section {
                    HStack {
                        Text("TMB (Taxa Metabólica Basal)")
                        Spacer()
                        Text("\(Int(persistence.userProfile.bmr)) kcal")
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("TDEE (Gasto Diário Total)")
                        Spacer()
                        Text("\(Int(persistence.userProfile.tdee)) kcal")
                            .foregroundStyle(.secondary)
                    }
                    HStack {
                        Text("Meta Sugerida")
                        Spacer()
                        Text("\(Int(persistence.userProfile.suggestedCalorieTarget)) kcal")
                            .foregroundColor(.green)
                    }
                } header: {
                    Text("Estatísticas")
                }

                // Notifications Section
                Section {
                    Button {
                        showNotificationSettings = true
                    } label: {
                        HStack {
                            Image(systemName: "bell.fill")
                                .foregroundColor(.orange)
                            Text("Notificações")
                                .foregroundColor(.primary)
                            Spacer()
                            Text(persistence.userProfile.notificationsEnabled ? "Ativadas" : "Desativadas")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            Image(systemName: "chevron.right")
                                .foregroundStyle(.tertiary)
                        }
                    }
                } header: {
                    Text("Lembretes")
                }

                // Whoop Section
                Section {
                    HStack {
                        Image(systemName: "heart.circle.fill")
                            .foregroundColor(.green)
                        Text("Whoop")
                        Spacer()
                        if whoopService.isConnected {
                            Text("Conectado")
                                .font(.caption)
                                .foregroundColor(.green)
                        } else {
                            Text("Desconectado")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }

                    if let lastSync = whoopService.lastSyncDate {
                        HStack {
                            Text("Última sincronização")
                            Spacer()
                            Text(lastSync, style: .relative)
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Integrações")
                }

                // Data Section
                Section {
                    HStack {
                        Text("Alimentos cadastrados")
                        Spacer()
                        Text("\(persistence.foodDatabase.count)")
                            .foregroundStyle(.secondary)
                    }

                    Button(role: .destructive) {
                        showResetAlert = true
                    } label: {
                        HStack {
                            Image(systemName: "trash")
                            Text("Resetar todos os dados")
                        }
                    }
                } header: {
                    Text("Dados")
                }

                // About Section
                Section {
                    HStack {
                        Text("Versão")
                        Spacer()
                        Text("1.0.0")
                            .foregroundStyle(.secondary)
                    }
                } header: {
                    Text("Sobre")
                }
            }
            .navigationTitle("Configurações")
            .sheet(isPresented: $showProfileEdit) {
                ProfileEditView()
            }
            .sheet(isPresented: $showNotificationSettings) {
                NotificationSettingsView()
            }
            .alert("Resetar Dados?", isPresented: $showResetAlert) {
                Button("Cancelar", role: .cancel) {}
                Button("Resetar", role: .destructive) {
                    resetAllData()
                }
            } message: {
                Text("Todos os seus dados de refeições, metas e configurações serão apagados. Esta ação não pode ser desfeita.")
            }
        }
    }

    private func resetAllData() {
        persistence.mealEntries = []
        persistence.waterIntake = 0
        persistence.dailyGoal = DailyGoal()
        persistence.userProfile = UserProfile()
        persistence.foodDatabase = PersistenceController.defaultFoodDatabase()
        persistence.saveProfile()
        persistence.saveGoal()
        persistence.saveFoodDatabase()
        whoopService.disconnect()
    }
}

#Preview {
    SettingsView()
        .environmentObject(PersistenceController.shared)
        .environmentObject(NotificationService.shared)
        .environmentObject(WhoopService.shared)
}
