import SwiftUI

struct BeerDetailView: View {
    let beer: Beer

    var body: some View {
        VStack {
            asyncImage

            Text(beer.name)
        }        
    }

    var asyncImage: some View {
        AsyncImage(url: URL(string: beer.imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        .background(Color(.systemGray6))
        .padding(8)
    }
}

#Preview {
    BeerDetailView(beer: .mock)
}
