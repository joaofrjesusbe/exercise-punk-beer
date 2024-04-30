import SwiftUI

class BeerDetailFeature: Feature {
    let viewModel: BeerDetailViewModel

    init(beerId: BeerId, repository: any BeerListRepository) {
        self.viewModel = Self.createViewModel(beerId: beerId, repository: repository)

        Task { @MainActor in
            await viewModel.loadView()
        }
    }

    static func createViewModel(
        beerId: BeerId,
        repository: any BeerListRepository
    ) -> BeerDetailViewModel {
        let action = GetBeerAction(repository: repository, id: beerId)
        return BeerDetailViewModel(action: action)
    }
}
