extension Vertical: Swift.CustomStringConvertible {

    public var description: String {
        switch self {
        case .upward: return "upward"
        case .downward: return "downward"
        }
    }
}
