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
        .library(name: "Direction", targets: ["Direction"]),
        .library(name: "Direction Standard Library Integration", targets: ["Direction Standard Library Integration"]),
        .library(name: "Direction Foundation Library Integration", targets: ["Direction Foundation Library Integration"]),
        .library(name: "Direction Test Support", targets: ["Direction Test Support"]),
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
        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Direction",
            dependencies: [
                .product(name: "Hash", package: "swift-hash"),
                .product(name: "Comparison", package: "swift-comparison"),
                .product(name: "Pair", package: "swift-pair"),
            ],
            path: "Sources/Direction"
        ),
        .target(
            name: "Direction Standard Library Integration",
            dependencies: [
                .target(name: "Direction"),
            ],
            path: "Sources/Direction Standard Library Integration"
        ),
        .target(
            name: "Direction Foundation Library Integration",
            dependencies: [
                .target(name: "Direction"),
                .target(name: "Direction Standard Library Integration"),
            ],
            path: "Sources/Direction Foundation Library Integration"
        ),
        .target(
            name: "Direction Test Support",
            dependencies: [
                .target(name: "Direction"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Direction Tests",
            dependencies: [
                .target(name: "Direction"),
                .product(name: "Pair", package: "swift-pair"),
                .target(name: "Direction Test Support"),
                .target(name: "Direction Standard Library Integration"),
                .target(name: "Direction Foundation Library Integration"),
            ],
            path: "Tests/Direction Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
