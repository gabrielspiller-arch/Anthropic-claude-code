import SwiftUI
import AuthenticationServices

struct WhoopView: View {
    @EnvironmentObject var whoopService: WhoopService
    @EnvironmentObject var persistence: PersistenceController
    @State private var showDisconnectAlert = false

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    if whoopService.isConnected {
                        connectedView
                    } else {
                        disconnectedView
                    }
                }
                .padding()
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Whoop")
            .toolbar {
                if whoopService.isConnected {
                    ToolbarItem(placement: .primaryAction) {
                        Button {
                            Task { await whoopService.fetchTodayData() }
                        } label: {
                            Image(systemName: "arrow.clockwise")
                        }
                    }
                }
            }
            .alert("Desconectar Whoop?", isPresented: $showDisconnectAlert) {
                Button("Cancelar", role: .cancel) {}
                Button("Desconectar", role: .destructive) {
                    whoopService.disconnect()
                }
            } message: {
                Text("Seus dados do Whoop serão removidos do app.")
            }
        }
    }

    // MARK: - Connected View

    private var connectedView: some View {
        VStack(spacing: 20) {
            // Connection Status
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                Text("Whoop Conectado")
                    .font(.headline)
                Spacer()
                Button("Desconectar") {
                    showDisconnectAlert = true
                }
                .font(.caption)
                .foregroundColor(.red)
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            if whoopService.isLoading {
                ProgressView("Sincronizando dados...")
                    .padding()
            }

            if let data = whoopService.todayData {
                // Recovery Card
                recoveryCard(data: data)

                // Strain & Calories Card
                strainCard(data: data)

                // Sleep Card
                sleepCard(data: data)

                // Activities Card
                if !data.activities.isEmpty {
                    activitiesCard(data: data)
                }

                // Calorie Comparison
                calorieComparisonCard(data: data)
            }

            // Weekly Trend
            if !whoopService.weeklyData.isEmpty {
                weeklyTrendCard
            }

            if let error = whoopService.errorMessage {
                Text(error)
                    .font(.caption)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .task {
            await whoopService.fetchTodayData()
            await whoopService.fetchWeeklyData()
        }
    }

    // MARK: - Disconnected View

    private var disconnectedView: some View {
        VStack(spacing: 24) {
            Spacer()

            Image(systemName: "heart.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)

            Text("Conecte sua Whoop")
                .font(.title2)
                .fontWeight(.bold)

            Text("Importe automaticamente seus dados de gasto calórico, strain, recovery e sono para otimizar suas metas de dieta.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(alignment: .leading, spacing: 12) {
                FeatureRow(icon: "flame.fill", color: .orange, text: "Gasto calórico real (basal + atividade)")
                FeatureRow(icon: "heart.fill", color: .red, text: "Recovery e HRV para ajustar dieta")
                FeatureRow(icon: "moon.fill", color: .blue, text: "Dados de sono e qualidade")
                FeatureRow(icon: "figure.run", color: .green, text: "Atividades e strain detalhados")
                FeatureRow(icon: "bell.fill", color: .yellow, text: "Notificações baseadas no gasto real")
            }
            .padding()
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16))

            Button {
                connectWhoop()
            } label: {
                HStack {
                    Image(systemName: "link.circle.fill")
                    Text("Conectar Whoop")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
            }
            .padding(.horizontal)

            Text("Requer conta no Whoop Developer Portal")
                .font(.caption2)
                .foregroundStyle(.tertiary)

            Spacer()
        }
    }

    // MARK: - Cards

    private func recoveryCard(data: WhoopDailyData) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Recovery")
                    .font(.headline)
                Spacer()
            }

            HStack(spacing: 24) {
                ZStack {
                    Circle()
                        .stroke(recoveryColor(data.recoveryScore).opacity(0.2), lineWidth: 10)
                        .frame(width: 80, height: 80)

                    Circle()
                        .trim(from: 0, to: data.recoveryScore / 100)
                        .stroke(recoveryColor(data.recoveryScore), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: 80, height: 80)
                        .rotationEffect(.degrees(-90))

                    Text("\(Int(data.recoveryScore))%")
                        .font(.system(.title3, design: .rounded, weight: .bold))
                        .foregroundColor(recoveryColor(data.recoveryScore))
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundColor(.green)
                        Text("HRV: \(Int(data.hrv)) ms")
                    }
                    .font(.subheadline)

                    HStack {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                        Text("FC Repouso: \(Int(data.restingHeartRate)) bpm")
                    }
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

    private func strainCard(data: WhoopDailyData) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Strain & Calorias")
                    .font(.headline)
                Spacer()
                Text(data.strainLevel)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.orange.opacity(0.15))
                    .clipShape(Capsule())
            }

            HStack(spacing: 24) {
                VStack {
                    Text(String(format: "%.1f", data.strain))
                        .font(.system(size: 36, weight: .bold, design: .rounded))
                        .foregroundColor(.orange)
                    Text("Strain (0-21)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        Text("Total:")
                        Spacer()
                        Text("\(Int(data.totalCaloriesBurned)) kcal")
                            .fontWeight(.bold)
                    }
                    HStack {
                        Text("Ativo:")
                        Spacer()
                        Text("\(Int(data.activeCaloriesBurned)) kcal")
                    }
                    HStack {
                        Text("Basal:")
                        Spacer()
                        Text("\(Int(data.basalCalories)) kcal")
                            .foregroundStyle(.secondary)
                    }
                }
                .font(.subheadline)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    private func sleepCard(data: WhoopDailyData) -> some View {
        VStack(spacing: 12) {
            HStack {
                Text("Sono")
                    .font(.headline)
                Spacer()
                Text("\(Int(data.sleepScore))%")
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }

            HStack {
                Image(systemName: "bed.double.fill")
                    .font(.title)
                    .foregroundColor(.blue)
                VStack(alignment: .leading) {
                    Text(String(format: "%.1f horas", data.sleepHours))
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Performance do sono: \(Int(data.sleepScore))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    private func activitiesCard(data: WhoopDailyData) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Atividades")
                .font(.headline)

            ForEach(data.activities) { activity in
                HStack {
                    Image(systemName: "figure.run")
                        .foregroundColor(.orange)
                        .frame(width: 30)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(activity.name)
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Text("Strain: \(String(format: "%.1f", activity.strain)) | \(activity.durationFormatted)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    VStack(alignment: .trailing) {
                        Text("\(Int(activity.calories)) kcal")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        Text("Avg: \(Int(activity.averageHeartRate)) bpm")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
                if activity.id != data.activities.last?.id {
                    Divider()
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    private func calorieComparisonCard(data: WhoopDailyData) -> some View {
        let consumed = persistence.todaySummary().totalCaloriesConsumed
        let burned = data.totalCaloriesBurned
        let deficit = burned - consumed

        return VStack(spacing: 12) {
            Text("Balanço Calórico")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)

            HStack(spacing: 30) {
                VStack {
                    Image(systemName: "fork.knife")
                        .font(.title2)
                        .foregroundColor(.green)
                    Text("\(Int(consumed))")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Consumido")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Image(systemName: "minus")
                    .font(.title2)
                    .foregroundStyle(.secondary)

                VStack {
                    Image(systemName: "flame.fill")
                        .font(.title2)
                        .foregroundColor(.orange)
                    Text("\(Int(burned))")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text("Gasto")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Image(systemName: "equal")
                    .font(.title2)
                    .foregroundStyle(.secondary)

                VStack {
                    Image(systemName: deficit >= 0 ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                        .font(.title2)
                        .foregroundColor(deficit >= 0 ? .blue : .red)
                    Text("\(Int(abs(deficit)))")
                        .font(.title3)
                        .fontWeight(.bold)
                    Text(deficit >= 0 ? "Déficit" : "Superávit")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Weekly Trend

    private var weeklyTrendCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Tendência Semanal")
                .font(.headline)

            HStack(spacing: 8) {
                ForEach(whoopService.weeklyData) { data in
                    VStack(spacing: 4) {
                        // Strain bar
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.orange)
                            .frame(width: 24, height: CGFloat(data.strain / 21.0) * 60)

                        // Recovery dot
                        Circle()
                            .fill(recoveryColor(data.recoveryScore))
                            .frame(width: 12, height: 12)

                        Text(dayAbbrev(data.date))
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100, alignment: .bottom)

            HStack(spacing: 16) {
                HStack(spacing: 4) {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(Color.orange)
                        .frame(width: 12, height: 12)
                    Text("Strain")
                        .font(.caption2)
                }
                HStack(spacing: 4) {
                    Circle().fill(.green).frame(width: 8, height: 8)
                    Text("67-100%")
                        .font(.caption2)
                }
                HStack(spacing: 4) {
                    Circle().fill(.yellow).frame(width: 8, height: 8)
                    Text("34-66%")
                        .font(.caption2)
                }
                HStack(spacing: 4) {
                    Circle().fill(.red).frame(width: 8, height: 8)
                    Text("0-33%")
                        .font(.caption2)
                }
            }
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8)
    }

    // MARK: - Helpers

    private func connectWhoop() {
        guard let url = URL(string: whoopService.authorizationURL.absoluteString) else { return }
        UIApplication.shared.open(url)
    }

    private func recoveryColor(_ score: Double) -> Color {
        switch score {
        case 67...100: return .green
        case 34...66: return .yellow
        default: return .red
        }
    }

    private func dayAbbrev(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        formatter.locale = Locale(identifier: "pt_BR")
        return String(formatter.string(from: date).prefix(3))
    }
}

struct FeatureRow: View {
    let icon: String
    let color: Color
    let text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(color)
                .frame(width: 24)
            Text(text)
                .font(.subheadline)
        }
    }
}

#Preview {
    WhoopView()
        .environmentObject(WhoopService.shared)
        .environmentObject(PersistenceController.shared)
}
