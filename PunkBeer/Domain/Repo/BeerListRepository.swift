import Foundation

protocol BeerListService: ListingService
where Query == String, Item == Beer, Metadata == Void { }

protocol BeerListRepository: ListingRepository
where Service: BeerListService { }
