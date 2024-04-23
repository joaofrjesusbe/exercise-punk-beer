import SwiftUI

@main
struct PunkBeerApp: App {
    @State private var coordinator = MainCoordinator()

    var body: some Scene {
        WindowGroup {
            MainNavigationView()
                .environment(coordinator)
        }
    }
}
