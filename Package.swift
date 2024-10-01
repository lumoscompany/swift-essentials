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
        .library(name: "Essentials", targets: ["Essentials", "ReadableByteCollection"]),
        .library(name: "ReadableByteCollection", targets: ["ReadableByteCollection"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ReadableByteCollection",
            dependencies: [
                "Essentials",
            ],
            path: "Sources/ReadableByteCollection",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "Essentials",
            dependencies: [],
            path: "Sources/Essentials",
            swiftSettings: [IS_APPLE]
        ),
    ]
)
