// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ModularAnalytics",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "ModularAnalytics", targets: ["ModularAnalytics"]),
    ],
    targets: [
        .target(
            name: "ModularAnalytics",
            path: "Sources/ModularAnalytics",
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]
        ),
        .testTarget(
            name: "ModularAnalyticsTests",
            dependencies: ["ModularAnalytics"],
            path: "Tests/ModularAnalyticsTests"
        ),
    ]
)
