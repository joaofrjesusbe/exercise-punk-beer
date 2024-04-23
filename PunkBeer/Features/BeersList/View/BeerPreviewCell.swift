import SwiftUI

struct BeerPreviewCell: View {
    let beer: BeerPreviewUI
    let didSelect: (BeerId) -> Void

    var body: some View {
        Button(action: {
            didSelect(beer.beerId)
        }, label: {
            HStack(alignment: .center) {
                asyncImage

                VStack(alignment: .leading, spacing: 8) {
                    Text(beer.name)
                }
                Spacer(minLength: 8)
            }.padding(8)
        })
    }

    var asyncImage: some View {
        AsyncImage(url: beer.preview) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 150, maxHeight: 80)
            case .failure:
                Image(systemName: "photo")
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: 150, height: 80)
        .background(Color(.systemGray6))
        .padding(8)
    }
}

#Preview {
    BeerPreviewCell(
        beer: .mock,
        didSelect: {_ in }
    )
}
