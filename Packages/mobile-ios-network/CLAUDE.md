# Agent: ModularNetworkAgent

## Scope
Owns all HTTP networking abstractions: request modeling, URLSession execution, error normalization, and response decoding. Does NOT own authentication tokens — those are injected by the app layer via request headers.

## Module
`ModularNetwork` — no inter-package dependencies, Foundation only.

## Constraints
- Never import SwiftUI, ModularTheme, ModularAnalytics, or ModularRouter.
- No third-party networking libraries — Foundation URLSession only.
- `HTTPClient` must remain a protocol (mockable in app-target tests).
- `NetworkError` is the only error type that crosses this package boundary.
- All async functions must be `Sendable`-safe; avoid `nonisolated(unsafe)`.

## Build & Test
```bash
cd Packages/mobile-ios-network
swift build
swift test
```

## File Ownership
| File | Purpose |
|------|---------|
| `Sources/ModularNetwork/NetworkRequest.swift` | `NetworkRequest` protocol + `HTTPMethod` enum |
| `Sources/ModularNetwork/HTTPClient.swift` | `HTTPClient` protocol + `URLSessionHTTPClient` |
| `Sources/ModularNetwork/NetworkError.swift` | `NetworkError` enum |

## Adding Endpoints
Endpoints live in the app target or a future feature package — **not here**. This package owns the transport layer only. To add an endpoint: define a type conforming to `NetworkRequest` in the consumer and call `HTTPClient.send(_:baseURL:)`.
