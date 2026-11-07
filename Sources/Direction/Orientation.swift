public import Pair

public protocol Orientation: Sendable, Hashable, CaseIterable where AllCases == [Self] {

    var opposite: Self { get }

    var direction: Direction { get }

    init(direction: Direction)
}

extension Orientation {

    @inlinable
    public static prefix func ! (value: Self) -> Self {
        value.opposite
    }

    @inlinable
    public static var allCases: [Self] {
        Direction.allCases.map { Self(direction: $0) }
    }
}

extension Orientation {

    @inlinable
    public init(_ condition: Bool) {
        self.init(direction: condition ? Direction.positive : Direction.negative)
    }

    @inlinable
    public var isPositive: Bool {
        direction == Direction.positive
    }

    @inlinable
    public var isNegative: Bool {
        direction == Direction.negative
    }
}

public typealias Oriented<
    O: Orientation,
    Scalar: ~Copyable & ~Escapable
> = Pair<O, Scalar>

extension Orientation {

    public typealias Value<Scalar: ~Copyable & ~Escapable> = Oriented<Self, Scalar>
}
