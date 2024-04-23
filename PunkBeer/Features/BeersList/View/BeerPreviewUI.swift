import Foundation

struct BeerPreviewUI: Identifiable, Hashable, Equatable {
    var id: UUID
    var beerId: Int
    var name: String
    let preview: URL?

    init(_ beer: Beer) {
        self.id = UUID()
        self.beerId = beer.id
        self.name = beer.name
        self.preview = URL(string: beer.imageUrl)
    }

    static var mock: BeerPreviewUI {
        BeerPreviewUI(Beer.mock)
    }
}
