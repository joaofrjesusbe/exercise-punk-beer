import SwiftUI

class BeerListFeature: Feature {
    let viewModel: BeerListViewModel
    let router: BeerListRouter

    init(repository: any BeerListRepository, router: BeerListRouter) {
        self.router = router
        self.viewModel = Self.createViewModel(repository: repository)

        Task { @MainActor in
            await viewModel.loadImages()
        }
    }

    var rootView: some View {
        BeerListRootView(viewModel: viewModel, router: router)
    }

    static func createViewModel(
        repository: any BeerListRepository
    ) -> BeerListViewModel {
        let action = BeerListNextPageAction(repository: repository)
        return BeerListViewModel(action: action)
    }
}
