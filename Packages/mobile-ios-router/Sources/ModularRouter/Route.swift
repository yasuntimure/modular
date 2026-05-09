import Foundation

public enum Route: Hashable, Sendable {
    case home
    case settings
    case detail(id: String)
}
