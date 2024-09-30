// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

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
            path: "Sources/Essentials"
        ),
        .target(
            name: "ReadableBytesCollection",
            dependencies: [
                "EssentialsExtensions",
                "EssentialsProtocols",
            ],
            path: "Sources/ReadableBytesCollection"
        ),
        .target(
            name: "EssentialsExtensions",
            path: "Sources/EssentialsExtensions"
        ),
        .target(
            name: "EssentialsProtocols",
            path: "Sources/EssentialsProtocols"
        ),
    ]
)
