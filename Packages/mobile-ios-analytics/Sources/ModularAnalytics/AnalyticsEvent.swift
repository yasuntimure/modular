import Foundation

public enum AnalyticsValue: Sendable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
}

public struct AnalyticsEvent: Sendable {
    public let name: String
    public let properties: [String: AnalyticsValue]

    public init(name: String, properties: [String: AnalyticsValue] = [:]) {
        self.name = name
        self.properties = properties
    }
}
