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
            name: "Direction Hash",
            targets: ["Direction Hash"]
        ),
        .library(
            name: "Direction Comparison",
            targets: ["Direction Comparison"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-atoms/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Direction",
            dependencies: []
        ),

        .target(
            name: "Direction Hash",
            dependencies: [
                .target(name: "Direction"),
                .product(name: "Hash Protocol", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Direction Comparison",
            dependencies: [
                .target(name: "Direction"),
                .product(name: "Comparison Protocol", package: "swift-comparison"),
            ]
        ),
        .testTarget(
            name: "Direction Tests",
            dependencies: [
                .target(name: "Direction"),
            ]
        ),
        .testTarget(
            name: "Direction Hash Tests",
            dependencies: [
                .target(name: "Direction Hash"),
            ]
        ),
        .testTarget(
            name: "Direction Comparison Tests",
            dependencies: [
                .target(name: "Direction Comparison"),
            ]
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
