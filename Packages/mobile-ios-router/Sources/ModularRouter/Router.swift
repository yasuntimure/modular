import SwiftUI
import Observation

public protocol IRoutable: Hashable, Sendable {}

@MainActor
@Observable
public final class Router {

    public var path = NavigationPath()

    public init() {}

    public func push<T: IRoutable>(_ route: T) {
        path.append(route)
    }

    public func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    public func popToRoot() {
        path.removeLast(path.count)
    }
}
