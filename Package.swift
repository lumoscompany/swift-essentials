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
        .library(name: "ReadableByteCollection", targets: ["ReadableByteCollection"]),
        .library(name: "SecureByteCollection", targets: ["SecureByteCollection"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Essentials",
            dependencies: [
                .byName(name: "EssentialsImplementation"),
                .byName(name: "ReadableByteCollection"),
                .byName(name: "SecureByteCollection"),
            ],
            path: "Sources/Essentials",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "EssentialsImplementation",
            dependencies: [],
            path: "Sources/EssentialsImplementation",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "ReadableByteCollection",
            dependencies: [
                "EssentialsImplementation",
            ],
            path: "Sources/ReadableByteCollection",
            swiftSettings: [IS_APPLE]
        ),
        .target(
            name: "SecureByteCollection",
            dependencies: [
                "EssentialsImplementation",
            ],
            path: "Sources/SecureByteCollection",
            swiftSettings: [IS_APPLE]
        ),
    ]
)
