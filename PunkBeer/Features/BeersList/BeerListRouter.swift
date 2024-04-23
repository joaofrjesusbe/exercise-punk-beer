import Foundation

struct BeerListRouter {
    var openDetail: (BeerId) -> Void

    init(openDetail: @escaping (BeerId) -> Void) {
        self.openDetail = openDetail
    }
}
