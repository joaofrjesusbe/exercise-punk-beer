import Foundation

final class BeerListNetworkService: BeerListService {
    private let defaultPageSize: Int
    private let session: URLSession

    init(session: URLSession = .shared, defaultPageSize: Int = 20) {
        self.session = session
        self.defaultPageSize = defaultPageSize
    }

    func requestPage(page: Int) async throws -> ListingPage<Beer, Void> {
        guard let url = PunkEndpoint.search(query: "", page: page, perPage: defaultPageSize).url else {
            throw NetworkError.urlMalform
        }

        do {
            let data = try await getData(from: url)
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

    private func getData(from url: URL) async throws -> Data {
        let (data, _) = try await session.data(from: url)
        return data
    }
}
