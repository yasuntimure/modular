// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ModularRouter",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "ModularRouter", targets: ["ModularRouter"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ModularRouter",
            dependencies: [],
            path: "Sources/ModularRouter",
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]
        ),
        .testTarget(
            name: "ModularRouterTests",
            dependencies: ["ModularRouter"],
            path: "Tests/ModularRouterTests"
        ),
    ]
)
