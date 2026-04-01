import SwiftUI

@main
struct DietTrackerApp: App {
    @StateObject private var persistenceController = PersistenceController.shared
    @StateObject private var notificationService = NotificationService.shared
    @StateObject private var whoopService = WhoopService.shared

    init() {
        NotificationService.shared.requestAuthorization()
    }

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(persistenceController)
                .environmentObject(notificationService)
                .environmentObject(whoopService)
        }
    }
}
