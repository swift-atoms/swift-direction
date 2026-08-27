// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-direction",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Direction",
            targets: ["Direction"]
        ),
        .library(
            name: "Direction Standard Library Integration",
            targets: ["Direction Standard Library Integration"]
        ),
        .library(
            name: "Direction Apple Foundation Integration",
            targets: ["Direction Apple Foundation Integration"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Direction",
            dependencies: []
        ),
        .target(
            name: "Direction Standard Library Integration",
            dependencies: ["Direction"]
        ),
        .target(
            name: "Direction Apple Foundation Integration",
            dependencies: [
                "Direction",
                "Direction Standard Library Integration",
            ]
        ),
        .testTarget(
            name: "Direction Tests",
            dependencies: ["Direction"],
            path: "Tests/Direction Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
