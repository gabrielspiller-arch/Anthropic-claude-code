import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            DashboardView()
                .tabItem {
                    Label("Dashboard", systemImage: "chart.bar.fill")
                }
                .tag(0)

            FoodLogView()
                .tabItem {
                    Label("Alimentação", systemImage: "fork.knife")
                }
                .tag(1)

            GoalsView()
                .tabItem {
                    Label("Metas", systemImage: "target")
                }
                .tag(2)

            WhoopView()
                .tabItem {
                    Label("Whoop", systemImage: "heart.circle.fill")
                }
                .tag(3)

            SettingsView()
                .tabItem {
                    Label("Config", systemImage: "gearshape.fill")
                }
                .tag(4)
        }
        .tint(.green)
    }
}

#Preview {
    MainTabView()
        .environmentObject(PersistenceController.shared)
        .environmentObject(NotificationService.shared)
        .environmentObject(WhoopService.shared)
}
