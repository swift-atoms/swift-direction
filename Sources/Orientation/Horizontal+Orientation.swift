public import Direction

extension Horizontal: Orientation {

    @inlinable
    public var direction: Direction {
        switch self {
        case .rightward: return .positive
        case .leftward: return .negative
        }
    }

    @inlinable
    public init(direction: Direction) {
        switch direction {
        case .positive: self = .rightward
        case .negative: self = .leftward
        }
    }
}
