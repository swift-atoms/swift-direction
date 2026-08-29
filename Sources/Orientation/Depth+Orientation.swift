public import Direction

extension Depth: Orientation {

    @inlinable
    public var direction: Direction {
        switch self {
        case .forward: return .positive
        case .backward: return .negative
        }
    }

    @inlinable
    public init(direction: Direction) {
        switch direction {
        case .positive: self = .forward
        case .negative: self = .backward
        }
    }
}
