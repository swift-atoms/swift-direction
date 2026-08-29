public import Direction

extension Temporal: Orientation {

    @inlinable
    public var direction: Direction {
        switch self {
        case .future: return .positive
        case .past: return .negative
        }
    }

    @inlinable
    public init(direction: Direction) {
        switch direction {
        case .positive: self = .future
        case .negative: self = .past
        }
    }
}
