import SwiftUI

@Observable
class MainCoordinator {
    var viewPath = NavigationPath()
    private var selectedDetail: BeerDetailFeature?

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
            repository: repository,
            router: .init(openDetail: { beer in
                self.viewPath.append(beer)
            })
        )
    }()

    func beerDetailFeature(_ beerId: Int) -> BeerDetailFeature {
        let feature = BeerDetailFeature(
            beerId: beerId,
            repository: repository
        )
        selectedDetail = feature
        return feature
    }

    func back() {
        selectedDetail = nil
        viewPath.removeLast()
    }
}
