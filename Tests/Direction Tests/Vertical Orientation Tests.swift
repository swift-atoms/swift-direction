import Testing

@testable import Direction

@Suite
struct `Vertical opposition exchanges its two cases` {
    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `opposite is involution`(vertical: Vertical) {
        #expect(Vertical.opposite(of: Vertical.opposite(of: vertical)) == vertical)
    }

    @Test
    func `opposite maps upward to downward`() {
        #expect(Vertical.opposite(of: .upward) == .downward)
    }

    @Test
    func `opposite maps downward to upward`() {
        #expect(Vertical.opposite(of: .downward) == .upward)
    }
}

@Suite
struct `Vertical properties preserve case identity and directional meaning` {
    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `opposite property delegates to static function`(vertical: Vertical) {
        #expect(vertical.opposite == Vertical.opposite(of: vertical))
    }

    @Test
    func `direction maps upward to positive`() {
        #expect(Vertical.upward.direction == .positive)
    }

    @Test
    func `direction maps downward to negative`() {
        #expect(Vertical.downward.direction == .negative)
    }

    @Test
    func `The upward predicate identifies the upward case`() {
        #expect(Vertical.upward.isUpward)
        #expect(!Vertical.downward.isUpward)
    }

    @Test
    func `The downward predicate identifies the downward case`() {
        #expect(Vertical.downward.isDownward)
        #expect(!Vertical.upward.isDownward)
    }

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `The positive predicate identifies positive Vertical values`(vertical: Vertical) {
        if vertical == .upward {
            #expect(vertical.isPositive)
        } else {
            #expect(!vertical.isPositive)
        }
    }

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `The negative predicate identifies negative Vertical values`(vertical: Vertical) {
        if vertical == .downward {
            #expect(vertical.isNegative)
        } else {
            #expect(!vertical.isNegative)
        }
    }
}

@Suite
struct `Vertical construction maps directions and Boolean values to cases` {
    @Test
    func `init from positive direction creates upward`() {
        #expect(Vertical(direction: .positive) == .upward)
    }

    @Test
    func `init from negative direction creates downward`() {
        #expect(Vertical(direction: .negative) == .downward)
    }

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `Vertical values round trip through Direction`(vertical: Vertical) {
        #expect(Vertical(direction: vertical.direction) == vertical)
    }

    @Test
    func `init from true creates upward`() {
        #expect(Vertical(true) == .upward)
    }

    @Test
    func `init from false creates downward`() {
        #expect(Vertical(false) == .downward)
    }
}

@Suite
struct `Vertical cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Vertical.allCases.count == 2)
    }

    @Test
    func `allCases contains upward`() {
        #expect(Vertical.allCases.contains(.upward))
    }

    @Test
    func `allCases contains downward`() {
        #expect(Vertical.allCases.contains(.downward))
    }

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `Vertical equality is reflexive`(vertical: Vertical) {
        #expect(vertical == vertical)
    }

    @Test
    func `Vertical inequality is symmetric for distinct cases`() {
        #expect(Vertical.upward != Vertical.downward)
        #expect(Vertical.downward != Vertical.upward)
    }

    @Test
    func `Sets distinguish the two Vertical cases`() {
        let set: Set<Vertical> = [.upward, .downward, .upward]
        #expect(set.count == 2)
    }

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `Vertical descriptions name a valid case`(vertical: Vertical) {
        let desc = vertical.description
        #expect(desc == "upward" || desc == "downward")
    }
}

@Suite
struct `Vertical negation exchanges cases and is involutive` {
    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `negation operator is involution`(vertical: Vertical) {
        #expect(!(!vertical) == vertical)
    }

    @Test
    func `negation maps upward to downward`() {
        #expect(!Vertical.upward == .downward)
    }

    @Test
    func `negation maps downward to upward`() {
        #expect(!Vertical.downward == .upward)
    }
}
