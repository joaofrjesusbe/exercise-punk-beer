import SwiftUI

struct BeerListRootView: View {
    @Environment(MainCoordinator.self) var coordinator
    let viewModel: BeerListViewModel    

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
                didSelect: coordinator.addValueToPath
            )
        case .failed:
            Text("Ups something went wrong")
        }
    }
}
