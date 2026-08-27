public import Direction

#if !hasFeature(Embedded)
    extension Direction: Codable {
        public init(from decoder: any Decoder) throws {
            let container = try decoder.singleValueContainer()
            switch try container.decode(String.self) {
            case "positive": self = .positive
            case "negative": self = .negative
            case let value:
                throw DecodingError.dataCorruptedError(
                    in: container,
                    debugDescription: "Unknown Direction value: \(value)"
                )
            }
        }

        public func encode(to encoder: any Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .positive: try container.encode("positive")
            case .negative: try container.encode("negative")
            }
        }
    }
#endif
