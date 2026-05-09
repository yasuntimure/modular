// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ModularNetwork",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "ModularNetwork", targets: ["ModularNetwork"]),
    ],
    targets: [
        .target(
            name: "ModularNetwork",
            path: "Sources/ModularNetwork",
            swiftSettings: [
                .swiftLanguageMode(.v6),
            ]
        ),
        .testTarget(
            name: "ModularNetworkTests",
            dependencies: ["ModularNetwork"],
            path: "Tests/ModularNetworkTests"
        ),
    ]
)
