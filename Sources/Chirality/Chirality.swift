public enum Chirality: Sendable, Hashable, CaseIterable {

    case left

    case right
}

extension Chirality {

    @inlinable
    public static func opposite(of chirality: Chirality) -> Chirality {
        switch chirality {
        case .left: return .right
        case .right: return .left
        }
    }
}

extension Chirality {

    @inlinable
    public var opposite: Chirality {
        Self.opposite(of: self)
    }

    @inlinable
    public static prefix func ! (value: Chirality) -> Chirality {
        Self.opposite(of: value)
    }

    @inlinable
    public var mirrored: Chirality { opposite }
}

extension Chirality {

    public static var standard: Chirality { .right }

    public static var directX: Chirality { .left }
}

#if !hasFeature(Embedded)
    extension Chirality: Codable {}
#endif
