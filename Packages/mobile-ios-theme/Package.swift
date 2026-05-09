// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ModularTheme",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "ModularTheme", targets: ["ModularTheme"]),
    ],
    targets: [
        .target(
            name: "ModularTheme",
            path: "Sources/ModularTheme",
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]
        ),
        .testTarget(
            name: "ModularThemeTests",
            dependencies: ["ModularTheme"],
            path: "Tests/ModularThemeTests"
        ),
    ]
)
