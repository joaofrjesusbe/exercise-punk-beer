import SwiftUI

@Observable
final class BeerDetailViewModel {
    private(set) var state: ViewState<Beer> = .loading
    private let repo: any BeerListRepository

    init(repo: any BeerListRepository) {
        self.repo = repo
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
