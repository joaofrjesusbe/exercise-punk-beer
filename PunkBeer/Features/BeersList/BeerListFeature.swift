import SwiftUI

class BeerListFeature: Feature {
    let viewModel: BeerListViewModel

    init(repository: any BeerListRepository) {
        self.viewModel = Self.createViewModel(repository: repository)

        Task { @MainActor in
            await viewModel.loadImages()
        }
    }

    static func createViewModel(
        repository: any BeerListRepository
    ) -> BeerListViewModel {
        let action = BeerListNextPageAction(repository: repository)
        return BeerListViewModel(action: action)
    }
}
