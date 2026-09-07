import Testing

@testable import Direction

@Suite
struct `Horizontal opposition exchanges its two cases` {
    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `opposite is involution`(horizontal: Horizontal) {
        #expect(Horizontal.opposite(of: Horizontal.opposite(of: horizontal)) == horizontal)
    }

    @Test
    func `opposite maps rightward to leftward`() {
        #expect(Horizontal.opposite(of: .rightward) == .leftward)
    }

    @Test
    func `opposite maps leftward to rightward`() {
        #expect(Horizontal.opposite(of: .leftward) == .rightward)
    }
}

@Suite
struct `Horizontal properties preserve case identity and directional meaning` {
    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `opposite property delegates to static function`(horizontal: Horizontal) {
        #expect(horizontal.opposite == Horizontal.opposite(of: horizontal))
    }

    @Test
    func `direction maps rightward to positive`() {
        #expect(Horizontal.rightward.direction == .positive)
    }

    @Test
    func `direction maps leftward to negative`() {
        #expect(Horizontal.leftward.direction == .negative)
    }

    @Test
    func `The rightward predicate identifies the rightward case`() {
        #expect(Horizontal.rightward.isRightward)
        #expect(!Horizontal.leftward.isRightward)
    }

    @Test
    func `The leftward predicate identifies the leftward case`() {
        #expect(Horizontal.leftward.isLeftward)
        #expect(!Horizontal.rightward.isLeftward)
    }

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `The positive predicate identifies positive Horizontal values`(horizontal: Horizontal) {
        if horizontal == .rightward {
            #expect(horizontal.isPositive)
        } else {
            #expect(!horizontal.isPositive)
        }
    }

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `The negative predicate identifies negative Horizontal values`(horizontal: Horizontal) {
        if horizontal == .leftward {
            #expect(horizontal.isNegative)
        } else {
            #expect(!horizontal.isNegative)
        }
    }
}

@Suite
struct `Horizontal construction maps directions and Boolean values to cases` {
    @Test
    func `init from positive direction creates rightward`() {
        #expect(Horizontal(direction: .positive) == .rightward)
    }

    @Test
    func `init from negative direction creates leftward`() {
        #expect(Horizontal(direction: .negative) == .leftward)
    }

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `Horizontal values round trip through Direction`(horizontal: Horizontal) {
        #expect(Horizontal(direction: horizontal.direction) == horizontal)
    }

    @Test
    func `init from true creates rightward`() {
        #expect(Horizontal(true) == .rightward)
    }

    @Test
    func `init from false creates leftward`() {
        #expect(Horizontal(false) == .leftward)
    }
}

@Suite
struct `Horizontal cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Horizontal.allCases.count == 2)
    }

    @Test
    func `allCases contains rightward`() {
        #expect(Horizontal.allCases.contains(.rightward))
    }

    @Test
    func `allCases contains leftward`() {
        #expect(Horizontal.allCases.contains(.leftward))
    }

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `Horizontal equality is reflexive`(horizontal: Horizontal) {
        #expect(horizontal == horizontal)
    }

    @Test
    func `Horizontal inequality is symmetric for distinct cases`() {
        #expect(Horizontal.rightward != Horizontal.leftward)
        #expect(Horizontal.leftward != Horizontal.rightward)
    }

    @Test
    func `Sets distinguish the two Horizontal cases`() {
        let set: Set<Horizontal> = [.rightward, .leftward, .rightward]
        #expect(set.count == 2)
    }

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `Horizontal descriptions name a valid case`(horizontal: Horizontal) {
        let desc = horizontal.description
        #expect(desc == "rightward" || desc == "leftward")
    }
}

@Suite
struct `Horizontal negation exchanges cases and is involutive` {
    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `negation operator is involution`(horizontal: Horizontal) {
        #expect(!(!horizontal) == horizontal)
    }

    @Test
    func `negation maps rightward to leftward`() {
        #expect(!Horizontal.rightward == .leftward)
    }

    @Test
    func `negation maps leftward to rightward`() {
        #expect(!Horizontal.leftward == .rightward)
    }
}
