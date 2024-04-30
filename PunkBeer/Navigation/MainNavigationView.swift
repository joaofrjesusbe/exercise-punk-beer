import SwiftUI

struct MainNavigationView: View {
    @Environment(MainCoordinator.self) var coordinator 

    var body: some View {
        NavigationStack(path: Bindable(coordinator).viewPath) {
            BeerListRootView(viewModel: coordinator.beerListFeature.viewModel)
            .navigationDestination(for: BeerId.self) { beer in
                BeerDetailRootView(viewModel: coordinator.beerDetailFeature(beer).viewModel)
            }
        }
    }
}

