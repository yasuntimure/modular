import Foundation

struct DeepLinkHandler: Sendable {

    func handle(url: URL) -> Route? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }

        switch components.path {
        case "/", "/home":
            return .home
        case "/settings":
            return .settings
        default:
            if components.path.hasPrefix("/detail/") {
                let id = String(components.path.dropFirst("/detail/".count))
                return id.isEmpty ? nil : .detail(id: id)
            }
            return nil
        }
    }
}
