public enum Winding: Sendable, Hashable, CaseIterable {

    case clockwise

    case counterclockwise
}

extension Winding {

    @inlinable
    public static func opposite(of winding: Winding) -> Winding {
        switch winding {
        case .clockwise: return .counterclockwise
        case .counterclockwise: return .clockwise
        }
    }
}

extension Winding {

    @inlinable
    public var opposite: Winding {
        Self.opposite(of: self)
    }

    @inlinable
    public static prefix func ! (value: Winding) -> Winding {
        Self.opposite(of: value)
    }
}

extension Winding {

    public static var cw: Winding { .clockwise }

    public static var ccw: Winding { .counterclockwise }
}

#if !hasFeature(Embedded)
    extension Winding: Codable {}
#endif
