extension Horizontal: Swift.CustomStringConvertible {

    public var description: String {
        switch self {
        case .rightward: return "rightward"
        case .leftward: return "leftward"
        }
    }
}
