extension Depth: Swift.CustomStringConvertible {

    public var description: String {
        switch self {
        case .forward: return "forward"
        case .backward: return "backward"
        }
    }
}
