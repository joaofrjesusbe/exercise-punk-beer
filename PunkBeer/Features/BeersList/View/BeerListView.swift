import SwiftUI

struct BeerListView: View {
    let items: [BeerPreviewUI]
    let onItemAppear: (Int) -> Void
    let didSelect: (BeerId) -> Void

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(
                    Array(items.enumerated()),
                    id: \.element)
                { index, element in
                    BeerPreviewCell(
                        beer: element,
                        didSelect: didSelect
                    )
                    .onAppear {
                        onItemAppear(index)
                    }
                }
            }
            .background(.white)
        }
    }
}

#Preview {
    BeerListView(
        items: [.mock, .mock, .mock, .mock],
        onItemAppear: { _ in },
        didSelect: { _ in }
    )
}
