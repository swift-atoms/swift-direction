import Testing

@testable import Direction

@Suite
struct `Winding opposition exchanges its two cases` {
    @Test(arguments: [Winding.clockwise, Winding.counterclockwise])
    func `opposite is involution`(winding: Winding) {
        #expect(Winding.opposite(of: Winding.opposite(of: winding)) == winding)
    }

    @Test
    func `opposite maps clockwise to counterclockwise`() {
        #expect(Winding.opposite(of: .clockwise) == .counterclockwise)
    }

    @Test
    func `opposite maps counterclockwise to clockwise`() {
        #expect(Winding.opposite(of: .counterclockwise) == .clockwise)
    }
}

@Suite
struct `Winding properties preserve case identity and directional meaning` {
    @Test(arguments: [Winding.clockwise, Winding.counterclockwise])
    func `opposite property delegates to static function`(winding: Winding) {
        #expect(winding.opposite == Winding.opposite(of: winding))
    }

    @Test
    func `cw is alias for clockwise`() {
        #expect(Winding.cw == .clockwise)
    }

    @Test
    func `ccw is alias for counterclockwise`() {
        #expect(Winding.ccw == .counterclockwise)
    }
}

@Suite
struct `Winding negation exchanges cases and is involutive` {
    @Test(arguments: [Winding.clockwise, Winding.counterclockwise])
    func `negation operator is involution`(winding: Winding) {
        #expect(!(!winding) == winding)
    }

    @Test
    func `negation maps clockwise to counterclockwise`() {
        #expect(!Winding.clockwise == .counterclockwise)
    }

    @Test
    func `negation maps counterclockwise to clockwise`() {
        #expect(!Winding.counterclockwise == .clockwise)
    }
}

@Suite
struct `Winding cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Winding.allCases.count == 2)
    }

    @Test
    func `allCases contains clockwise`() {
        #expect(Winding.allCases.contains(.clockwise))
    }

    @Test
    func `allCases contains counterclockwise`() {
        #expect(Winding.allCases.contains(.counterclockwise))
    }

    @Test(arguments: [Winding.clockwise, Winding.counterclockwise])
    func `Winding equality is reflexive`(winding: Winding) {
        #expect(winding == winding)
    }

    @Test
    func `Winding inequality is symmetric for distinct cases`() {
        #expect(Winding.clockwise != Winding.counterclockwise)
        #expect(Winding.counterclockwise != Winding.clockwise)
    }

    @Test
    func `Sets distinguish the two Winding cases`() {
        let set: Set<Winding> = [.clockwise, .counterclockwise, .clockwise]
        #expect(set.count == 2)
    }
}
