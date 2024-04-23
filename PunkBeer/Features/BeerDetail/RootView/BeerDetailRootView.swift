import SwiftUI

struct BeerDetailRootView: View {
    @Environment(MainCoordinator.self) var coordinator
    let viewModel: BeerDetailViewModel

    var body: some View {
        ZStack(alignment: .center) {
            stateView
        }
        .background(.white)
        .navigationTitle("Detail")
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Back") {
                    coordinator.back()
                }
            }
        }
    }

    @ViewBuilder
    var stateView: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
        case .didLoad(let item):
            BeerDetailView(
                beer: item
            )
        case .failed:
            Text("Ups something went wrong")
        }
    }
}
