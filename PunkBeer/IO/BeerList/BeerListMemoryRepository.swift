import Foundation

final class BeerListMemoryRepository<Service: BeerListService>:
    ListingMemoryRepository<Service>, BeerListRepository { }
