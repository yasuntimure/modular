import Testing
@testable import Modular

@Suite("DeepLinkHandler")
struct DeepLinkHandlerTests {

    @Test func handlesHome() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/home")!) == .home)
        #expect(handler.handle(url: URL(string: "app://example.com/")!) == .home)
    }

    @Test func handlesSettings() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/settings")!) == .settings)
    }

    @Test func handlesDetail() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/detail/abc123")!) == .detail(id: "abc123"))
    }

    @Test func returnsNilForUnknown() {
        let handler = DeepLinkHandler()
        #expect(handler.handle(url: URL(string: "app://example.com/unknown/path")!) == nil)
    }
}
