import Foundation

struct BeerListNextPageAction {
    private let repository: any BeerListRepository

    init(repository: any BeerListRepository) {
        self.repository = repository
    }

    public func canExecute(itemIndex: Int) -> Bool {
        repository.shouldLoadNextPage(index: itemIndex)
    }

    public func callAsFunction() async throws -> [Beer] {
        let listing = try await repository.loadNextPage()
        return listing.items
    }
}
