import Foundation

struct GetBeerAction {
    private let repository: any BeerListRepository
    private let id: BeerId

    init(repository: any BeerListRepository, id: BeerId) {
        self.repository = repository
        self.id = id
    }

    public func callAsFunction() async throws -> Beer {
        let listing = repository.currentListing
        let beer = listing.items.first { $0.id == id }

        if let beer = beer {
            return beer
        }

        // Todo: provide with a way to load a beer
        throw NetworkError.general
    }
}
