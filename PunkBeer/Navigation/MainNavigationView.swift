import SwiftUI

struct MainNavigationView: View {
    @Environment(MainCoordinator.self) var coordinator 

    var body: some View {
        NavigationStack(path: Bindable(coordinator).viewPath) {
            coordinator.beerListFeature.rootView
            .navigationDestination(for: BeerId.self) { beer in
                coordinator.beerDetailFeature(beer).rootView
            }
        }
    }
}

