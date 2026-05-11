// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "ModularUI",
    platforms: [
        .iOS(.v26),
        .macOS(.v26),
        .visionOS(.v26),
    ],
    products: [
        .library(name: "ModularUI", targets: ["ModularUI"]),
    ],
    dependencies: [
        .package(path: "../mobile-ios-router"),
        .package(path: "../mobile-ios-theme"),
    ],
    targets: [
        .target(
            name: "ModularUI",
            dependencies: [
                .product(name: "ModularRouter", package: "mobile-ios-router"),
                .product(name: "ModularTheme", package: "mobile-ios-theme"),
            ]
        ),
        .testTarget(
            name: "ModularUITests",
            dependencies: ["ModularUI"]
        ),
    ]
)
