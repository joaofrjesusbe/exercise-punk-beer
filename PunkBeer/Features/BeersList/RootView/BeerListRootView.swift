import SwiftUI

struct BeerListRootView: View {
    let viewModel: BeerListViewModel
    let router: BeerListRouter

    var body: some View {
        ZStack(alignment: .center) {
            stateView
        }
        .background(.white)        
        .navigationTitle("List")
    }

    @ViewBuilder
    var stateView: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .didLoad(let items):
            BeerListView(
                items: items,
                onItemAppear: viewModel.itemDidAppear,
                didSelect: router.openDetail
            )
        case .failed:
            Text("Ups something went wrong")
        }
    }
}
