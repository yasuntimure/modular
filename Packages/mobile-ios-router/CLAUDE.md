# Agent: ModularRouterAgent

## Scope
Owns the generic `Router` observable object (NavigationPath wrapper). Route definitions and deep-link parsing are app-specific and live in the app target (`Modular/`).

## Module
`ModularRouter` — no external package dependencies.

## Constraints
- Never import `ModularNetwork` or `ModularAnalytics`.
- `Router` is `@MainActor` — all navigation mutations happen on the main actor.
- `Router.push` accepts any `Hashable & Sendable` type — it must not reference any concrete route type.

## Build & Test
```bash
cd Packages/mobile-ios-router
swift test
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularRouter/Router.swift` | `@MainActor @Observable Router` with `NavigationPath` |
