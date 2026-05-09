# Agent: ModularAnalyticsAgent

## Scope
Owns event definitions, the `AnalyticsProvider` protocol, and the `Analytics` fan-out actor. Does NOT contain concrete SDK integrations (Firebase, Amplitude, etc.) — those are app-target implementations.

## Module
`ModularAnalytics` — no inter-package dependencies, no UI imports.

## Constraints
- Never import SwiftUI, ModularTheme, ModularNetwork, or ModularRouter.
- `AnalyticsEvent` and `AnalyticsValue` must be `Sendable`.
- `Analytics` is an `actor` — never add `@MainActor` to it.
- Provider registrations happen at app startup in `ModularApp.swift`.
- Event names use snake_case string constants defined as static factory methods on `AnalyticsEvent` — no raw strings at call sites.

## Build & Test
```bash
cd Packages/mobile-ios-analytics
swift build
swift test
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularAnalytics/AnalyticsEvent.swift` | `AnalyticsEvent` struct + `AnalyticsValue` enum |
| `Sources/ModularAnalytics/AnalyticsProvider.swift` | `AnalyticsProvider` protocol |
| `Sources/ModularAnalytics/Analytics.swift` | `Analytics` actor (fan-out to providers) |

## Adding Events
1. Add a `static` factory method to `AnalyticsEvent` (e.g., `static func buttonTapped(name: String) -> Self`).
2. Test in `ModularAnalyticsTests` that properties are set correctly.
3. Call from the app target: `await Analytics.shared.track(.buttonTapped(name: "login"))`.
