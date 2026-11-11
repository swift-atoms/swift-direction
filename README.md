# swift-direction

Use this package when a value needs a two-valued sense along an axis, such as left or right, up or down, forward or backward, future or past, or a plain sign. Start from `Direction`, the abstract positive/negative sense, and from the `Orientation` protocol that its named axes `Horizontal`, `Vertical`, `Depth` and `Temporal` conform to. Use `Chirality` for handedness and `Winding` for rotation sense: neither has a canonical sign, so neither converts to `Direction`. Use `Winding.Number` for how many times a closed curve turns around a point, and `Winding.Rule` (`nonzero` or `evenodd`) to decide from that number whether the point is inside. To carry a payload alongside the sense, use `Oriented<O, Scalar>`, `Chirality.Value<Payload>` or `Winding.Value<Payload>`. These are aliases of `Pair` from swift-pair.

## Laws

- Every `Orientation` is isomorphic to `Direction`. `T(direction: x.direction) == x` holds for every value. The positive case is `Horizontal.rightward`, `Vertical.upward`, `Depth.forward` and `Temporal.future`, so converting between two orientations through `Direction` maps positive to positive.
- `opposite` is an involution on every type, and the prefix `!` is the same operation. `Chirality.mirrored` is `Chirality.opposite`.
- `init(_:)` taking a `Bool` maps `true` to the positive case and `false` to the negative case.
- `Direction(sign:)` maps zero to `Direction.positive`. `Direction.sign` is `1` or `-1`, never `0`.
- `Direction` equality, hashing and ordering all follow `sign`, so `Direction.negative < Direction.positive`.
- On every `Orientation`, `allCases` lists the positive case first, then the negative case.
- `Chirality.standard` is right-handed, and `Chirality.directX` is left-handed.
- A `Winding.Number` is a signed count of full turns. Numbers add as their turns do, so the number of several curves together is the sum of their numbers, and negation is the number of the same curve run backwards. Which rotation sense counts as positive is not fixed here: whoever measures the number says.
- `Winding.Rule.nonzero` contains every number except zero, and `Winding.Rule.evenodd` contains exactly the odd numbers. Neither contains zero, both answer the same for a number and its negation, and they agree on −1, 0 and 1. `allCases` lists `nonzero` first.
