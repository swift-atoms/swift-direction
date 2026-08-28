# Direction

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The canonical binary orientation for Swift — a pure positive/negative polarity with `opposite` and a sign multiplier, carrying no domain interpretation and zero external dependencies.

---

## Quick Start

`Direction` is a two-case enum — `.positive` / `.negative` — modelling pure polarity, isomorphic to `Z/2Z`, `Bool`, and the multiplicative group `{-1, +1}`. It is the atomic sign factor underlying oriented and composite spatial types, so it stays free of any axis or coordinate meaning.

```swift
import Direction_Comparison

let forward: Direction = .positive

// `opposite` is an involution: applying it twice returns the original.
forward.opposite            // .negative
forward.opposite.opposite   // .positive

// `sign` is the multiplicative representative in {-1, +1}.
Direction.positive.sign     // 1
Direction.negative.sign     // -1

// Construct from any signed value: zero and positives map to .positive.
Direction(sign: -3)         // .negative
Direction(sign: 0)          // .positive

// Comparison is available from Direction Comparison; .negative precedes .positive.
[Direction.positive, .negative].sorted()   // [.negative, .positive]
```

`Direction` does not decide *which* axis or coordinate is being oriented. Domain-specific orientations (`Horizontal`, `Vertical`, `Depth`, `Temporal`) and the `Orientation` abstraction live in `swift-dimension`, which conforms `Direction` to `Orientation` retroactively so this package stays dependency-free.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-atoms/swift-direction.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Direction", package: "swift-direction"),
    ]
)
```

Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

The base `Direction` target holds the type and has zero external dependencies. Each sibling target adds one institute conformance and depends on the base module.

| Product | When to import |
|---------|----------------|
| `Direction` | The `Direction` enum, its `opposite` / `sign` operations and operators, and conditional `Codable`. No external dependencies. |
| `Direction Hash` | Conformance of `Direction` to `Hash.Protocol`. |
| `Direction Comparison` | Conformance of `Direction` to `Comparison.Protocol`. |

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |
| Swift Embedded | Supported |

`Codable` conformance is available everywhere except Swift Embedded, where it is compiled out.

---

## Community

<!-- BEGIN: discussion -->
*Discussion thread will be created at first public release.*
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE](LICENSE.md).
