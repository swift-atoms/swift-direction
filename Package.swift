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
            name: "Direction Primitive",
            targets: ["Direction Primitive"]
        ),

        .library(
            name: "Direction Equation",
            targets: ["Direction Equation"]
        ),
        .library(
            name: "Direction Hash",
            targets: ["Direction Hash"]
        ),
        .library(
            name: "Direction Comparison",
            targets: ["Direction Comparison"]
        ),

        .library(
            name: "Direction",
            targets: ["Direction"]
        ),

        .library(
            name: "Direction Test Support",
            targets: ["Direction Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-equation.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-hash.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-comparison.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Direction Primitive",
            dependencies: []
        ),

        .target(
            name: "Direction Equation",
            dependencies: [
                "Direction Primitive",
                .product(name: "Equation", package: "swift-equation"),
            ]
        ),
        .target(
            name: "Direction Hash",
            dependencies: [
                "Direction Primitive",
                .product(name: "Hash", package: "swift-hash"),
            ]
        ),
        .target(
            name: "Direction Comparison",
            dependencies: [
                "Direction Primitive",
                .product(name: "Comparison", package: "swift-comparison"),
            ]
        ),

        .target(
            name: "Direction",
            dependencies: [
                "Direction Primitive",
                "Direction Equation",
                "Direction Hash",
                "Direction Comparison",
            ]
        ),

        .target(
            name: "Direction Test Support",
            dependencies: [
                "Direction"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Direction Tests",
            dependencies: [
                "Direction",
                "Direction Test Support",
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
