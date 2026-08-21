// swift-tools-version: 6.4
import PackageDescription

let package = Package(
    name: "swift-direction-primitives",
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
            name: "Direction Equation Primitives",
            targets: ["Direction Equation Primitives"]
        ),
        .library(
            name: "Direction Hash Primitives",
            targets: ["Direction Hash Primitives"]
        ),
        .library(
            name: "Direction Comparison Primitives",
            targets: ["Direction Comparison Primitives"]
        ),

        .library(
            name: "Direction Primitives",
            targets: ["Direction Primitives"]
        ),

        .library(
            name: "Direction Primitives Test Support",
            targets: ["Direction Primitives Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-equation-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-hash-primitives.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-primitives/swift-comparison-primitives.git",
            branch: "main"
        ),
    ],
    targets: [

        .target(
            name: "Direction Primitive",
            dependencies: []
        ),

        .target(
            name: "Direction Equation Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Equation Primitives", package: "swift-equation-primitives"),
            ]
        ),
        .target(
            name: "Direction Hash Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Hash Primitives", package: "swift-hash-primitives"),
            ]
        ),
        .target(
            name: "Direction Comparison Primitives",
            dependencies: [
                "Direction Primitive",
                .product(name: "Comparison Primitives", package: "swift-comparison-primitives"),
            ]
        ),

        .target(
            name: "Direction Primitives",
            dependencies: [
                "Direction Primitive",
                "Direction Equation Primitives",
                "Direction Hash Primitives",
                "Direction Comparison Primitives",
            ]
        ),

        .target(
            name: "Direction Primitives Test Support",
            dependencies: [
                "Direction Primitives"
            ],
            path: "Tests/Support"
        ),

        .testTarget(
            name: "Direction Primitives Tests",
            dependencies: [
                "Direction Primitives",
                "Direction Primitives Test Support",
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
