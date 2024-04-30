import SwiftUI

protocol Feature {
    associatedtype ViewModel

    var viewModel: ViewModel { get }
}
