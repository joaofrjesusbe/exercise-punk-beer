import SwiftUI

@Observable
final class BeerListViewModel {
    private(set) var state: ViewState<[BeerPreviewUI]> = .loading
    private(set) var paginationState: ListingPaginationState = .idle
    private let action: BeerListNextPageAction

    init(action: BeerListNextPageAction) {
        self.action = action
    }

    @MainActor
    func loadImages() async {
        state = .loading
        do {
            let items = try await action().map(BeerPreviewUI.init)
            state = .didLoad(items)
        } catch {
            state = .failed
        }
    }

    func itemDidAppear(index: Int) {
        guard action.canExecute(itemIndex: index) else {
            return
        }

        Task {
            paginationState = .loading
            do {
                let items = try await action().map(BeerPreviewUI.init)
                state = .didLoad(items)
                paginationState = .idle
            } catch {
                paginationState = .failed
            }
        }
    }
}
