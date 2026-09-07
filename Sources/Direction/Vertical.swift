public enum Vertical: Sendable, Hashable, CaseIterable {

    case upward

    case downward
}

extension Vertical {

    @inlinable
    public static func opposite(of orientation: Vertical) -> Vertical {
        switch orientation {
        case .upward: return .downward
        case .downward: return .upward
        }
    }
}

extension Vertical {

    @inlinable
    public var opposite: Vertical {
        Self.opposite(of: self)
    }
}

extension Vertical {

    @inlinable
    public var isUpward: Bool { self == .upward }

    @inlinable
    public var isDownward: Bool { self == .downward }
}

extension Vertical: CustomStringConvertible {

    public var description: String {
        switch self {
        case .upward: return "upward"
        case .downward: return "downward"
        }
    }
}

#if !hasFeature(Embedded)
    extension Vertical: Codable {}
#endif
