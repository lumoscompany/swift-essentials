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
                "EssentialExtensions",
                "EssentialProtocols",
                "EssentialTypes",
            ],
            path: "Sources/Essentials",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "ReadableBytesCollection",
            dependencies: [
                "EssentialExtensions",
                "EssentialProtocols",
            ],
            path: "Sources/ReadableBytesCollection",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialExtensions",
            path: "Sources/EssentialExtensions",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialProtocols",
            path: "Sources/EssentialProtocols",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialTypes",
            path: "Sources/EssentialTypes",
            swiftSettings: [IS_APPLE]
        ),
    ]
)
