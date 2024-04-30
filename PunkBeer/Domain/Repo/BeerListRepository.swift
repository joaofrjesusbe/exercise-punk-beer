import Combine

typealias BeerListing = Listing<Beer, Void>

protocol BeerListRepository {

    var listing: AnyPublisher<BeerListing, Never> { get }

    var selectedBeer: Beer? { get set }

    func reset()

    func shouldLoadNextPage(index: Int) -> Bool

    func loadNextPage()

    func update(beer: Beer)
}
