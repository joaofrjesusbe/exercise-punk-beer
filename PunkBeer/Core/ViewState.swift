import Foundation

enum ViewState<Object> {
    case loading
    case didLoad(Object)
    case failed
}
