import Testing
@testable import ModularUI

@MainActor
struct ModularUITests {
    @Test func requestModelIsHashable() {
        let r1 = Request(id: "1", title: "T", description: "D", status: .pending, createdAt: .distantPast)
        let r2 = Request(id: "1", title: "T", description: "D", status: .pending, createdAt: .distantPast)
        #expect(r1 == r2)
    }
}
