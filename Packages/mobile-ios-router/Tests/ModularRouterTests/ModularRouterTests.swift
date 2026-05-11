import Foundation
import Testing
@testable import ModularRouter

private enum MockRoute: IRoutable {
    case alpha
    case beta(id: String)
}

@Suite("Router")
@MainActor
struct ModularRouterTests {

    @Test func pushAppendsToPath() {
        let router = Router()
        #expect(router.path.count == 0)
        router.push(MockRoute.alpha)
        #expect(router.path.count == 1)
    }

    @Test func popRemovesLastEntry() {
        let router = Router()
        router.push(MockRoute.alpha)
        router.push(MockRoute.beta(id: "x"))
        router.pop()
        #expect(router.path.count == 1)
    }

    @Test func popOnEmptyPathDoesNothing() {
        let router = Router()
        router.pop()
        #expect(router.path.count == 0)
    }

    @Test func popToRootClearsAllEntries() {
        let router = Router()
        router.push(MockRoute.alpha)
        router.push(MockRoute.beta(id: "y"))
        router.push(MockRoute.alpha)
        router.popToRoot()
        #expect(router.path.count == 0)
    }
}
