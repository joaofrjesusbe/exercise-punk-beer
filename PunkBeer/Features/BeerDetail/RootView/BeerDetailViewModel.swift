import SwiftUI

@Observable
final class BeerDetailViewModel {
    private(set) var state: ViewState<Beer> = .loading
    private let action: GetBeerAction

    init(action: GetBeerAction) {
        self.action = action
    }

    @MainActor
    func loadView() async {
        state = .loading
        do {
            let item = try await action()
            state = .didLoad(item)
        } catch {
            state = .failed
        }
    }
}
