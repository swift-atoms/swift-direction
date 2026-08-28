public enum Direction: Sendable {

    case positive

    case negative
}

extension Direction {

    @inlinable
    public static func opposite(of direction: Direction) -> Direction {
        switch direction {
        case .positive: return .negative
        case .negative: return .positive
        }
    }

    @inlinable
    public var opposite: Direction {
        Self.opposite(of: self)
    }
}

extension Direction {

    @inlinable
    public var sign: Int {
        switch self {
        case .positive: return 1
        case .negative: return -1
        }
    }

    @inlinable
    public init(sign: Int) {
        self = sign >= 0 ? .positive : .negative
    }
}

extension Direction {

    @inlinable
    public static func == (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign == rhs.sign
    }

    @inlinable
    public static func < (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign < rhs.sign
    }

    @inlinable
    public static func <= (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign <= rhs.sign
    }

    @inlinable
    public static func > (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign > rhs.sign
    }

    @inlinable
    public static func >= (lhs: Direction, rhs: Direction) -> Bool {
        lhs.sign >= rhs.sign
    }

    @inlinable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(sign)
    }
}

#if !hasFeature(Embedded)
    extension Direction: Codable {}
#endif
