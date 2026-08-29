public enum Depth: Sendable, Hashable, CaseIterable {

    case forward

    case backward
}

extension Depth {

    @inlinable
    public static func opposite(of orientation: Depth) -> Depth {
        switch orientation {
        case .forward: return .backward
        case .backward: return .forward
        }
    }
}

extension Depth {

    @inlinable
    public var opposite: Depth {
        Self.opposite(of: self)
    }
}

extension Depth {

    @inlinable
    public var isForward: Bool { self == .forward }

    @inlinable
    public var isBackward: Bool { self == .backward }
}

extension Depth: CustomStringConvertible {

    public var description: String {
        switch self {
        case .forward: return "forward"
        case .backward: return "backward"
        }
    }
}

#if !hasFeature(Embedded)
    extension Depth: Codable {}
#endif
