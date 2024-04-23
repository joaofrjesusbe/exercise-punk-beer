import Foundation

struct PunkEndpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension PunkEndpoint {

    static func search(
        query: String,
        page: Int,
        perPage: Int
    ) -> PunkEndpoint {
        return PunkEndpoint(
            path: "/v2/beers",
            queryItems: [
                URLQueryItem(name: "per_page", value: perPage.description),
                URLQueryItem(name: "page", value: page.description)
            ]
        )
    }
}

extension PunkEndpoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.punkapi.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
