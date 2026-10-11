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

        .library(name: "Direction Foundation Integration", targets: ["Direction Foundation Integration"]),
        .library(name: "Direction Test Support", targets: ["Direction Test Support"]),
    ],
    dependencies: [


        .package(
            url: "https://github.com/swift-atoms/swift-pair.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Direction",
            dependencies: [
                .product(name: "Pair", package: "swift-pair"),
            ],
            path: "Sources/Direction"
        ),
        
        .target(
            name: "Direction Foundation Integration",
            dependencies: [
                .target(name: "Direction"),
            ],
            path: "Sources/Direction Foundation Integration"
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
            ],
            path: "Tests/Direction Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    target.swiftSettings = (target.swiftSettings ?? []) + [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableUpcomingFeature("InferIsolatedConformances"),
        .enableExperimentalFeature("Lifetimes"),
        .treatAllWarnings(as: .error),
    ]
}
