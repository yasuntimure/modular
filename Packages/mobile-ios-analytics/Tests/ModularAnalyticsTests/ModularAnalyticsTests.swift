import Testing
@testable import ModularAnalytics

@Suite("ModularAnalytics")
struct ModularAnalyticsTests {

    @Test func eventStoresName() {
        let event = AnalyticsEvent(name: "button_tapped")
        #expect(event.name == "button_tapped")
        #expect(event.properties.isEmpty)
    }

    @Test func eventStoresProperties() {
        let event = AnalyticsEvent(name: "purchase", properties: ["amount": .double(9.99), "item": .string("pro")])
        #expect(event.properties["amount"] != nil)
        #expect(event.properties["item"] != nil)
    }

    @Test func analyticsSharedInstanceExists() async {
        let analytics = Analytics.shared
        await analytics.track(AnalyticsEvent(name: "test"))
    }
}
