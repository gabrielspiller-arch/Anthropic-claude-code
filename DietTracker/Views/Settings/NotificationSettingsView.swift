import SwiftUI

struct NotificationSettingsView: View {
    @EnvironmentObject var persistence: PersistenceController
    @EnvironmentObject var notificationService: NotificationService
    @Environment(\.dismiss) var dismiss

    @State private var notificationsEnabled: Bool
    @State private var notificationTimes: [NotificationTime]

    init() {
        let profile = PersistenceController.shared.userProfile
        _notificationsEnabled = State(initialValue: profile.notificationsEnabled)
        _notificationTimes = State(initialValue: profile.notificationTimes)
    }

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Toggle("Notificações Ativadas", isOn: $notificationsEnabled)

                    if !notificationService.isAuthorized {
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.orange)
                            Text("Permissão de notificação não concedida. Ative nas Configurações do iOS.")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                } header: {
                    Text("Geral")
                }

                if notificationsEnabled {
                    Section {
                        ForEach($notificationTimes) { $notif in
                            HStack {
                                Toggle(isOn: $notif.isEnabled) {
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(notif.label)
                                            .font(.subheadline)
                                        Text(notif.timeString)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                            }
                        }
                    } header: {
                        Text("Horários dos Lembretes")
                    } footer: {
                        Text("Você receberá notificações nos horários configurados para registrar suas refeições e acompanhar o progresso diário.")
                    }

                    Section {
                        HStack {
                            Image(systemName: "moon.fill")
                                .foregroundColor(.blue)
                            VStack(alignment: .leading) {
                                Text("Resumo Diário")
                                    .font(.subheadline)
                                Text("22:00 - Resumo de calorias e metas")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }

                        HStack {
                            Image(systemName: "heart.circle.fill")
                                .foregroundColor(.green)
                            VStack(alignment: .leading) {
                                Text("Atualização Whoop")
                                    .font(.subheadline)
                                Text("Ao sincronizar dados do Whoop")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        }
                    } header: {
                        Text("Notificações Automáticas")
                    }
                }
            }
            .navigationTitle("Notificações")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        saveSettings()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }

    private func saveSettings() {
        persistence.userProfile.notificationsEnabled = notificationsEnabled
        persistence.userProfile.notificationTimes = notificationTimes
        persistence.saveProfile()

        // Reschedule notifications
        notificationService.scheduleAllNotifications(
            profile: persistence.userProfile,
            goal: persistence.dailyGoal
        )

        dismiss()
    }
}

#Preview {
    NotificationSettingsView()
        .environmentObject(PersistenceController.shared)
        .environmentObject(NotificationService.shared)
}
