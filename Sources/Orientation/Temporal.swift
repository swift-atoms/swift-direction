public enum Temporal: Sendable, Hashable, CaseIterable {

    case future

    case past
}

extension Temporal {

    @inlinable
    public static func opposite(of orientation: Temporal) -> Temporal {
        switch orientation {
        case .future: return .past
        case .past: return .future
        }
    }
}

extension Temporal {

    @inlinable
    public var opposite: Temporal {
        Self.opposite(of: self)
    }
}

extension Temporal {

    @inlinable
    public var isFuture: Bool { self == .future }

    @inlinable
    public var isPast: Bool { self == .past }
}

extension Temporal: CustomStringConvertible {

    public var description: String {
        switch self {
        case .future: return "future"
        case .past: return "past"
        }
    }
}

#if !hasFeature(Embedded)
    extension Temporal: Codable {}
#endif
