import SwiftUI
import Observation

@MainActor
@Observable
public final class Router {

    public var path = NavigationPath()

    public init() {}

    public func push(_ route: Route) {
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
