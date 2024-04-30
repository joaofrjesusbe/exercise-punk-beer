import Foundation

final class BeerListMockService: BeerListService {
    private let defaultPageSize: Int
    private let filename: String

    init(filename: String = "beerlist", defaultPageSize: Int = 20) {
        self.filename = filename
        self.defaultPageSize = defaultPageSize
    }

    func requestPage(page: Int) async throws -> ListingPage<Beer, Void> {
        do {
            let data = try await getData(from: filename)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let beers = try decoder.decode([Beer].self, from: data)
            var page = ListingPage<Beer, Void>(pageNumber: page, items: beers)
            page.hasNextPage = beers.count == defaultPageSize
            return page

        } catch let error {
            print("Error \(error.localizedDescription)")
            throw NetworkError.general
        }
    }

    private func getData(from filename: String) async throws -> Data {
        guard let path = Bundle.main.path(forResource: filename, ofType: "json") else {
            throw NetworkError.urlMalform
        }
        let url = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: url, options: .alwaysMapped)
        return data
    }
}
