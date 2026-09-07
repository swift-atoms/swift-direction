import Testing

@testable import Direction

@Suite
struct `Temporal opposition exchanges its two cases` {
    @Test(arguments: [Temporal.future, Temporal.past])
    func `opposite is involution`(temporal: Temporal) {
        #expect(Temporal.opposite(of: Temporal.opposite(of: temporal)) == temporal)
    }

    @Test
    func `opposite maps future to past`() {
        #expect(Temporal.opposite(of: .future) == .past)
    }

    @Test
    func `opposite maps past to future`() {
        #expect(Temporal.opposite(of: .past) == .future)
    }
}

@Suite
struct `Temporal properties preserve case identity and directional meaning` {
    @Test(arguments: [Temporal.future, Temporal.past])
    func `opposite property delegates to static function`(temporal: Temporal) {
        #expect(temporal.opposite == Temporal.opposite(of: temporal))
    }

    @Test
    func `direction maps future to positive`() {
        #expect(Temporal.future.direction == .positive)
    }

    @Test
    func `direction maps past to negative`() {
        #expect(Temporal.past.direction == .negative)
    }

    @Test
    func `The future predicate identifies the future case`() {
        #expect(Temporal.future.isFuture)
        #expect(!Temporal.past.isFuture)
    }

    @Test
    func `The past predicate identifies the past case`() {
        #expect(Temporal.past.isPast)
        #expect(!Temporal.future.isPast)
    }

    @Test(arguments: [Temporal.future, Temporal.past])
    func `The positive predicate identifies positive Temporal values`(temporal: Temporal) {
        if temporal == .future {
            #expect(temporal.isPositive)
        } else {
            #expect(!temporal.isPositive)
        }
    }

    @Test(arguments: [Temporal.future, Temporal.past])
    func `The negative predicate identifies negative Temporal values`(temporal: Temporal) {
        if temporal == .past {
            #expect(temporal.isNegative)
        } else {
            #expect(!temporal.isNegative)
        }
    }
}

@Suite
struct `Temporal construction maps directions and Boolean values to cases` {
    @Test
    func `init from positive direction creates future`() {
        #expect(Temporal(direction: .positive) == .future)
    }

    @Test
    func `init from negative direction creates past`() {
        #expect(Temporal(direction: .negative) == .past)
    }

    @Test(arguments: [Temporal.future, Temporal.past])
    func `Temporal values round trip through Direction`(temporal: Temporal) {
        #expect(Temporal(direction: temporal.direction) == temporal)
    }

    @Test
    func `init from true creates future`() {
        #expect(Temporal(true) == .future)
    }

    @Test
    func `init from false creates past`() {
        #expect(Temporal(false) == .past)
    }
}

@Suite
struct `Temporal cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Temporal.allCases.count == 2)
    }

    @Test
    func `allCases contains future`() {
        #expect(Temporal.allCases.contains(.future))
    }

    @Test
    func `allCases contains past`() {
        #expect(Temporal.allCases.contains(.past))
    }

    @Test(arguments: [Temporal.future, Temporal.past])
    func `Temporal equality is reflexive`(temporal: Temporal) {
        #expect(temporal == temporal)
    }

    @Test
    func `Temporal inequality is symmetric for distinct cases`() {
        #expect(Temporal.future != Temporal.past)
        #expect(Temporal.past != Temporal.future)
    }

    @Test
    func `Sets distinguish the two Temporal cases`() {
        let set: Set<Temporal> = [.future, .past, .future]
        #expect(set.count == 2)
    }

    @Test(arguments: [Temporal.future, Temporal.past])
    func `Temporal descriptions name a valid case`(temporal: Temporal) {
        let desc = temporal.description
        #expect(desc == "future" || desc == "past")
    }
}

@Suite
struct `Temporal negation exchanges cases and is involutive` {
    @Test(arguments: [Temporal.future, Temporal.past])
    func `negation operator is involution`(temporal: Temporal) {
        #expect(!(!temporal) == temporal)
    }

    @Test
    func `negation maps future to past`() {
        #expect(!Temporal.future == .past)
    }

    @Test
    func `negation maps past to future`() {
        #expect(!Temporal.past == .future)
    }
}
