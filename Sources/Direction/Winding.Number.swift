extension Winding {

    /// How many times a closed curve turns around a point: a signed count of full turns.
    ///
    /// Which rotation sense counts as positive is the measurer's convention, not this type's.
    public struct Number: Sendable, Hashable {

        public var turns: Int

        @inlinable
        public init<Source: BinaryInteger>(_ turns: Source) {
            self.turns = Int(turns)
        }
    }
}

extension Winding.Number: ExpressibleByIntegerLiteral {

    @inlinable
    public init(integerLiteral value: Int) {
        self.turns = value
    }
}

extension Winding.Number: AdditiveArithmetic {

    @inlinable
    public static var zero: Self { 0 }

    @inlinable
    public static func + (lhs: Self, rhs: Self) -> Self {
        Self(lhs.turns + rhs.turns)
    }

    @inlinable
    public static func - (lhs: Self, rhs: Self) -> Self {
        Self(lhs.turns - rhs.turns)
    }

    @inlinable
    public static prefix func - (value: Self) -> Self {
        Self(-value.turns)
    }
}

extension Winding.Number: Comparable {

    @inlinable
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.turns < rhs.turns
    }
}

#if !hasFeature(Embedded)
    extension Winding.Number: Swift::Codable {}
#endif
