// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let IS_APPLE: SwiftSetting = .define("IS_APPLE", .when(platforms: [.macOS, .iOS]))

let package = Package(
    name: "swift-essentials",
    platforms: [
        .macOS("13.3"),
        .iOS("16.4"),
    ],
    products: [
        .library(name: "Essentials", targets: ["Essentials"]),
        .library(name: "ReadableBytesCollection", targets: ["ReadableBytesCollection"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Essentials",
            dependencies: [
                "ReadableBytesCollection",
                "EssentialsExtensions",
                "EssentialsProtocols",
            ],
            path: "Sources/Essentials",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "ReadableBytesCollection",
            dependencies: [
                "EssentialsExtensions",
                "EssentialsProtocols",
            ],
            path: "Sources/ReadableBytesCollection",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialsExtensions",
            path: "Sources/EssentialsExtensions",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialsProtocols",
            path: "Sources/EssentialsProtocols",
            swiftSettings: [IS_APPLE]
        ),
    ]
)
