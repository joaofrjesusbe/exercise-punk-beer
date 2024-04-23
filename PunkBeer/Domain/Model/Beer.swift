import Foundation

public typealias BeerId = Int

public struct Beer: Codable, Identifiable, Hashable {
    public let id: BeerId
    public let name: String
    public let tagline: String
    public let firstBrewed: String
    public let description: String
    public let imageUrl: String
}

extension Beer {
    static var mock: Beer {
        Beer(
            id: 192,
            name: "Punk IPA 2007 - 2010",
            tagline: "Post Modern Classic. Spiky. Tropical. Hoppy.",
            firstBrewed: "04/2007",
            description: 
            """
            Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.
            """,
            imageUrl: "https://images.punkapi.com/v2/192.png"
        )
    }
}
