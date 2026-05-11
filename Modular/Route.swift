import Foundation

enum Route: Hashable, Sendable {
    case home
    case settings
    case detail(id: String)
}
