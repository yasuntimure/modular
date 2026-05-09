# Agent: ModularRouterAgent

## Scope
Owns the navigation graph (`Route` enum), `Router` observable object, and deep-link URL parsing. Depends on `ModularTheme` for access to design tokens in transition metadata.

## Module
`ModularRouter` — depends on `ModularTheme` only.

## Constraints
- Never import `ModularNetwork` or `ModularAnalytics`.
- `Router` is `@MainActor` — all navigation mutations happen on the main actor.
- `Route` must be `Hashable` and `Sendable`.
- `DeepLinkHandler` must not assume any URL scheme — return `nil` for unrecognized patterns.
- New route cases are added to `Route` here; destination view mapping lives in the app target's `NavigationStack`.

## Build & Test
```bash
cd Packages/mobile-ios-router
swift test   # resolves mobile-ios-theme via relative path automatically
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularRouter/Route.swift` | Typed route enum |
| `Sources/ModularRouter/Router.swift` | `@MainActor Router: ObservableObject` with `NavigationPath` |
| `Sources/ModularRouter/DeepLinkHandler.swift` | URL → `Route` parsing |

## Adding Routes
1. Add a case to `Route` (must be `Hashable` + `Sendable`).
2. Handle in `DeepLinkHandler.handle(url:)` if it has a URL pattern.
3. Add a `@Test` in `ModularRouterTests` for the new deep-link pattern.
4. Wire the destination view in the app target via `.navigationDestination(for: Route.self)`.
