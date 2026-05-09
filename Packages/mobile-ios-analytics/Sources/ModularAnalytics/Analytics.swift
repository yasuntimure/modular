import Foundation

public actor Analytics {
    public static let shared = Analytics()

    private var providers: [any AnalyticsProvider] = []

    private init() {}

    public func register(_ provider: any AnalyticsProvider) {
        providers.append(provider)
    }

    public func track(_ event: AnalyticsEvent) async {
        await withTaskGroup(of: Void.self) { group in
            for provider in providers {
                group.addTask {
                    await provider.track(event)
                }
            }
        }
    }
}
