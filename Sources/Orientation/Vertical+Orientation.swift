public import Direction

extension Vertical: Orientation {

    @inlinable
    public var direction: Direction {
        switch self {
        case .upward: return .positive
        case .downward: return .negative
        }
    }

    @inlinable
    public init(direction: Direction) {
        switch direction {
        case .positive: self = .upward
        case .negative: self = .downward
        }
    }
}
