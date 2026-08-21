import Direction_Primitives
import Testing

@Suite
struct `Direction - Static Functions` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Direction - Static Functions`.Unit {
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
struct `Direction - Properties` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Direction - Properties`.Unit {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite property delegates to static function`(direction: Direction) {
        #expect(direction.opposite == Direction.opposite(of: direction))
    }

    @Test
    func `sign returns 1 for positive`() {
        #expect(Direction.positive.sign == 1)
    }

    @Test
    func `sign returns -1 for negative`() {
        #expect(Direction.negative.sign == -1)
    }
}

@Suite
struct `Direction - Initializers` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Direction - Initializers`.Unit {
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
}

@Suite
struct `Direction - Protocol Conformances` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Direction - Protocol Conformances`.Unit {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `Equatable reflexivity`(direction: Direction) {
        #expect(direction == direction)
    }

    @Test
    func `Equatable distinguishes the two cases`() {
        #expect(Direction.positive != Direction.negative)
    }

    @Test
    func `Hashable produces unique hashes`() {
        let set: Set<Direction> = [.positive, .negative, .positive]
        #expect(set.count == 2)
    }
}

@Suite
struct `Direction - Comparison` {
    @Suite struct Unit {}
    @Suite struct `Edge Case` {}
    @Suite struct Integration {}
}

extension `Direction - Comparison`.Unit {
    @Test
    func `negative precedes positive`() {
        #expect(Direction.negative < Direction.positive)
        #expect(Direction.positive > Direction.negative)
        #expect(!(Direction.positive < Direction.negative))
    }

    @Test
    func `comparison agrees with sign`() {
        #expect(
            (Direction.negative < Direction.positive)
                == (Direction.negative.sign < Direction.positive.sign)
        )
    }

    @Test
    func `sorting orders negative first`() {
        #expect([Direction.positive, Direction.negative].sorted() == [.negative, .positive])
    }
}
