# Agent: ModularThemeAgent

## Scope
Owns ALL visual design tokens for the Modular app: colors, typography, spacing, and future animation/shadow tokens.

## Module
`ModularTheme` — no external dependencies, no inter-package dependencies.

## Constraints
- Never import `ModularNetwork`, `ModularAnalytics`, or `ModularRouter`.
- All public types must be `Sendable`.
- No asset catalog access — all tokens are code-defined values.
- SwiftUI-only; no UIKit/AppKit imports.

## Build & Test
```bash
cd Packages/mobile-ios-theme
swift build
swift test
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularTheme/Colors.swift` | Color tokens via `AppColor` |
| `Sources/ModularTheme/Typography.swift` | Font scale via `AppFont` |
| `Sources/ModularTheme/Spacing.swift` | Spacing scale via `Spacing` |
| `Sources/ModularTheme/ThemeEnvironment.swift` | `AppTheme` struct + `EnvironmentValues` extension |

## Adding Tokens
1. Add a `static` member to the relevant type (`AppColor`, `AppFont`, or `Spacing`).
2. Add a `@Test` in `ModularThemeTests` verifying the value.
3. Consume the token in the app target or `ModularRouter`.
