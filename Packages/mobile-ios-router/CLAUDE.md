# Agent: ModularRouterAgent

## Scope
Owns the generic `Router` observable object (NavigationPath wrapper). Route definitions and deep-link parsing are app-specific and live in the app target (`Modular/`). Depends on `ModularTheme` for access to design tokens in transition metadata.

## Module
`ModularRouter` — depends on `ModularTheme` only.

## Constraints
- Never import `ModularNetwork` or `ModularAnalytics`.
- `Router` is `@MainActor` — all navigation mutations happen on the main actor.
- `Router.push` accepts any `Hashable & Sendable` type — it must not reference any concrete route type.

## Build & Test
```bash
cd Packages/mobile-ios-router
swift test   # resolves mobile-ios-theme via relative path automatically
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularRouter/Router.swift` | `@MainActor @Observable Router` with `NavigationPath` |
