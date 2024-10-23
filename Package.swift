// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "swift-synology",
    platforms: [
        .macOS(.v13),
        .macCatalyst(.v16),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "Synology", targets: ["Synology"])
    ],
    targets: [
        .target(name: "Synology")
    ]
)
