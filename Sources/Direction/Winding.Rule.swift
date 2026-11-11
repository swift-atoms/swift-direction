extension Winding {

    /// Which winding numbers count as inside a closed curve.
    public enum Rule: Sendable, Hashable, CaseIterable {

        case nonzero

        case evenodd
    }
}

extension Winding.Rule {

    @inlinable
    public func contains(_ number: Winding.Number) -> Bool {
        switch self {
        case .nonzero: return number.turns != 0
        case .evenodd: return !number.turns.isMultiple(of: 2)
        }
    }
}

#if !hasFeature(Embedded)
    extension Winding.Rule: Swift::Codable {}
#endif
