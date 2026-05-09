import Foundation
import Testing
@testable import ModularRouter

@Suite("ModularRouter")
struct ModularRouterTests {

    @Test func deepLinkHandlesHome() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/home")!) == .home)
        #expect(handler.handle(url: URL(string: "app://example.com/")!) == .home)
    }

    @Test func deepLinkHandlesSettings() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/settings")!) == .settings)
    }

    @Test func deepLinkHandlesDetail() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/detail/abc123")!) == .detail(id: "abc123"))
    }

    @Test func deepLinkReturnsNilForUnknown() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/unknown/path")!) == nil)
    }
}
