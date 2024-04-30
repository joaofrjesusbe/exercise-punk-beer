import Combine
import SwiftUI

@Observable
final class BeerListMemoryRepository: BeerListRepository {
    var listing: AnyPublisher<BeerListing, Never>
    
    func update(beer: Beer) {
        
    }
    

    
    func replace(beer: Beer) {
        
    }

    func shouldLoadNextPage(index: Int) -> Bool {
        false
    }

    func loadNextPage() {

    }
}
