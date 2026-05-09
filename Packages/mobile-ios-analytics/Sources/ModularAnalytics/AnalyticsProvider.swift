import Foundation

public protocol AnalyticsProvider: Sendable {
    func track(_ event: AnalyticsEvent) async
}
