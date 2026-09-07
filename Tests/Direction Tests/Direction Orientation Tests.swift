import Testing

@testable import Direction

@Suite
struct `Direction opposition exchanges its two cases` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite is involution`(direction: Direction) {
        #expect(Direction.opposite(of: Direction.opposite(of: direction)) == direction)
    }

    @Test
    func `opposite maps positive to negative`() {
        #expect(Direction.opposite(of: .positive) == .negative)
    }

    @Test
    func `opposite maps negative to positive`() {
        #expect(Direction.opposite(of: .negative) == .positive)
    }
}

@Suite
struct `Direction properties preserve case identity and directional meaning` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite property delegates to static function`(direction: Direction) {
        #expect(direction.opposite == Direction.opposite(of: direction))
    }

    @Test
    func `direction property returns self`() {
        #expect(Direction.positive.direction == .positive)
        #expect(Direction.negative.direction == .negative)
    }

    @Test
    func `sign returns 1 for positive`() {
        #expect(Direction.positive.sign == 1)
    }

    @Test
    func `sign returns -1 for negative`() {
        #expect(Direction.negative.sign == -1)
    }

    @Test(arguments: [Direction.positive, Direction.negative])
    func `The positive predicate identifies positive Direction values`(direction: Direction) {
        if direction == .positive {
            #expect(direction.isPositive)
        } else {
            #expect(!direction.isPositive)
        }
    }

    @Test(arguments: [Direction.positive, Direction.negative])
    func `The negative predicate identifies negative Direction values`(direction: Direction) {
        if direction == .negative {
            #expect(direction.isNegative)
        } else {
            #expect(!direction.isNegative)
        }
    }
}

@Suite
struct `Direction negation exchanges cases and is involutive` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `negation operator is involution`(direction: Direction) {
        #expect(!(!direction) == direction)
    }

    @Test
    func `negation maps positive to negative`() {
        #expect(!Direction.positive == .negative)
    }

    @Test
    func `negation maps negative to positive`() {
        #expect(!Direction.negative == .positive)
    }
}

@Suite
struct `Direction construction maps directions and Boolean values to cases` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `init from direction is identity`(direction: Direction) {
        #expect(Direction(direction: direction) == direction)
    }

    @Test
    func `init from non-negative sign creates positive`() {
        #expect(Direction(sign: 0) == .positive)
        #expect(Direction(sign: 1) == .positive)
        #expect(Direction(sign: 100) == .positive)
    }

    @Test
    func `init from negative sign creates negative`() {
        #expect(Direction(sign: -1) == .negative)
        #expect(Direction(sign: -100) == .negative)
    }

    @Test
    func `init from true creates positive`() {
        #expect(Direction(true) == .positive)
    }

    @Test
    func `init from false creates negative`() {
        #expect(Direction(false) == .negative)
    }
}

@Suite
struct `Direction cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Direction.allCases.count == 2)
    }

    @Test
    func `allCases contains positive`() {
        #expect(Direction.allCases.contains(.positive))
    }

    @Test
    func `allCases contains negative`() {
        #expect(Direction.allCases.contains(.negative))
    }

    @Test(arguments: [Direction.positive, Direction.negative])
    func `Direction equality is reflexive`(direction: Direction) {
        #expect(direction == direction)
    }

    @Test
    func `Direction inequality is symmetric for distinct cases`() {
        #expect(Direction.positive != Direction.negative)
        #expect(Direction.negative != Direction.positive)
    }

    @Test
    func `Sets distinguish the two Direction cases`() {
        let set: Set<Direction> = [.positive, .negative, .positive]
        #expect(set.count == 2)
    }
}
