# Agent: ModularAgent

This is the root coordinator agent for the Modular iOS project. It governs the app target and all cross-cutting decisions. Each Swift package under `Packages/` has its own agent with scoped instructions.

## Project

SwiftUI app targeting iOS 26.4 / macOS 26.3 / visionOS 26.4 (universal).
Swift 6 / swift-tools-version 6.2.
Strict concurrency enabled. Default actor isolation: `MainActor`.

## Multi-Agent System

| Agent | Directory | Scope |
|---|---|---|
| `ModularAgent` | `/` (this file) | App target, composition, cross-cutting decisions |
| `ModularThemeAgent` | `Packages/mobile-ios-theme/` | Colors, typography, spacing tokens |
| `ModularNetworkAgent` | `Packages/mobile-ios-network/` | HTTP transport, request modeling |
| `ModularAnalyticsAgent` | `Packages/mobile-ios-analytics/` | Event tracking, provider fan-out |
| `ModularRouterAgent` | `Packages/mobile-ios-router/` | Navigation graph, deep links |
| `ModularUIAgent` | `Packages/mobile-ios-ui/` | SwiftUI views, view models, shared UI models |

Cross-package changes flow **top-down**: propose at root, implement starting from the depended-on package first.

## Dependency Graph

```
ModularTheme      ←── ModularUI ←── Modular (app)
ModularRouter     ←── ModularUI ←── Modular (app)
ModularNetwork    ←────────────────── Modular (app)
ModularAnalytics  ←────────────────── Modular (app)
```

Never add dependencies that create cycles. `ModularNetwork` and `ModularAnalytics` must stay standalone (no imports of Theme, Router, or UI). `ModularUI` must NOT import `ModularNetwork` or `ModularAnalytics` — ViewModels that need I/O accept injected closures or protocol dependencies from the app target.

## Repository Layout

```
Modular/                        ← App target (ModularAgent)
  ModularApp.swift              ← @main, composition root, provider wiring
  ContentView.swift             ← Root UI view
  Route.swift                   ← App-specific IRoutable enum
  DeepLinkHandler.swift         ← URL-to-Route mapping
ModularTests/                   ← App unit tests (Swift Testing)
ModularUITests/                 ← UI tests (XCTest / XCUIApplication)
Packages/
  mobile-ios-theme/             ← ModularThemeAgent
  mobile-ios-network/           ← ModularNetworkAgent
  mobile-ios-analytics/         ← ModularAnalyticsAgent
  mobile-ios-router/            ← ModularRouterAgent
  mobile-ios-ui/                ← ModularUIAgent
```

## Build & Test

```bash
# Build app (after adding packages to Xcode project)
xcodebuild build -project Modular.xcodeproj -scheme Modular \
  -destination 'platform=iOS Simulator,name=iPhone 16'

# App unit tests
xcodebuild test -project Modular.xcodeproj -scheme Modular \
  -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing ModularTests

# App UI tests
xcodebuild test -project Modular.xcodeproj -scheme Modular \
  -destination 'platform=iOS Simulator,name=iPhone 16' -only-testing ModularUITests

# Package tests (standalone, no Xcode needed)
cd Packages/mobile-ios-theme     && swift test
cd Packages/mobile-ios-network   && swift test
cd Packages/mobile-ios-analytics && swift test
cd Packages/mobile-ios-router    && swift test
cd Packages/mobile-ios-ui        && swift test
```

## Xcode Integration

Add each package to `Modular.xcodeproj` via:
`File > Add Package Dependencies... > Add Local...` → select each `Packages/mobile-ios-*` directory → link the product to the `Modular` target.

`ModularUI`'s transitive dependency on `ModularRouter` and `ModularTheme` resolves automatically via SPM.

## Architecture Principles

- The app target (`Modular/`) is the composition root — it owns no business logic, only wiring.
- Packages expose public protocols; the app provides concrete implementations (e.g., a `ConsoleAnalyticsProvider`).
- All package types must be `Sendable`-safe; avoid `@unchecked Sendable`.
- Each package's `CLAUDE.md` lists what it must NOT import — enforce those boundaries strictly.
