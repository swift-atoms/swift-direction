public enum Horizontal: Sendable, Hashable, CaseIterable {

    case rightward

    case leftward
}

extension Horizontal {

    @inlinable
    public static func opposite(of orientation: Horizontal) -> Horizontal {
        switch orientation {
        case .rightward: return .leftward
        case .leftward: return .rightward
        }
    }
}

extension Horizontal {

    @inlinable
    public var opposite: Horizontal {
        Self.opposite(of: self)
    }
}

extension Horizontal {

    @inlinable
    public var isRightward: Bool { self == .rightward }

    @inlinable
    public var isLeftward: Bool { self == .leftward }
}

extension Horizontal: CustomStringConvertible {

    public var description: String {
        switch self {
        case .rightward: return "rightward"
        case .leftward: return "leftward"
        }
    }
}

#if !hasFeature(Embedded)
    extension Horizontal: Codable {}
#endif
