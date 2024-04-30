import SwiftUI

@Observable
class MainCoordinator {
    var viewPath = NavigationPath()
    private var featurePaths: [any Feature] = []

    func addValueToPath<Value: Hashable>(_ value: Value) {
        viewPath.append(value)
    }

    func back() {
        featurePaths.removeLast()
        viewPath.removeLast()
    }

    @ObservationIgnored
    private lazy var repository: any BeerListRepository = {
        let service = BeerListMockService()
        //let service = BeerListNetworkService()
        let repo = BeerListMemoryRepository(
            query: "",
            provider: service,
            minimumOffsetToLoadNextPage: 5
        )
        return repo
    }()

    @ObservationIgnored
    lazy var beerListFeature: BeerListFeature = {
        return BeerListFeature(
            repository: repository
        )
    }()

    func beerDetailFeature(_ beerId: BeerId) -> BeerDetailFeature {
        let feature = BeerDetailFeature(
            beerId: beerId,
            repository: repository
        )
        featurePaths.append(feature)
        return feature
    }
}
