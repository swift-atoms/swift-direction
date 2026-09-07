import Testing

@testable import Direction

@Suite
struct `Depth opposition exchanges its two cases` {
    @Test(arguments: [Depth.forward, Depth.backward])
    func `opposite is involution`(depth: Depth) {
        #expect(Depth.opposite(of: Depth.opposite(of: depth)) == depth)
    }

    @Test
    func `opposite maps forward to backward`() {
        #expect(Depth.opposite(of: .forward) == .backward)
    }

    @Test
    func `opposite maps backward to forward`() {
        #expect(Depth.opposite(of: .backward) == .forward)
    }
}

@Suite
struct `Depth properties preserve case identity and directional meaning` {
    @Test(arguments: [Depth.forward, Depth.backward])
    func `opposite property delegates to static function`(depth: Depth) {
        #expect(depth.opposite == Depth.opposite(of: depth))
    }

    @Test
    func `direction maps forward to positive`() {
        #expect(Depth.forward.direction == .positive)
    }

    @Test
    func `direction maps backward to negative`() {
        #expect(Depth.backward.direction == .negative)
    }

    @Test
    func `The forward predicate identifies the forward case`() {
        #expect(Depth.forward.isForward)
        #expect(!Depth.backward.isForward)
    }

    @Test
    func `The backward predicate identifies the backward case`() {
        #expect(Depth.backward.isBackward)
        #expect(!Depth.forward.isBackward)
    }

    @Test(arguments: [Depth.forward, Depth.backward])
    func `The positive predicate identifies positive Depth values`(depth: Depth) {
        if depth == .forward {
            #expect(depth.isPositive)
        } else {
            #expect(!depth.isPositive)
        }
    }

    @Test(arguments: [Depth.forward, Depth.backward])
    func `The negative predicate identifies negative Depth values`(depth: Depth) {
        if depth == .backward {
            #expect(depth.isNegative)
        } else {
            #expect(!depth.isNegative)
        }
    }
}

@Suite
struct `Depth construction maps directions and Boolean values to cases` {
    @Test
    func `init from positive direction creates forward`() {
        #expect(Depth(direction: .positive) == .forward)
    }

    @Test
    func `init from negative direction creates backward`() {
        #expect(Depth(direction: .negative) == .backward)
    }

    @Test(arguments: [Depth.forward, Depth.backward])
    func `Depth values round trip through Direction`(depth: Depth) {
        #expect(Depth(direction: depth.direction) == depth)
    }

    @Test
    func `init from true creates forward`() {
        #expect(Depth(true) == .forward)
    }

    @Test
    func `init from false creates backward`() {
        #expect(Depth(false) == .backward)
    }
}

@Suite
struct `Depth cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Depth.allCases.count == 2)
    }

    @Test
    func `allCases contains forward`() {
        #expect(Depth.allCases.contains(.forward))
    }

    @Test
    func `allCases contains backward`() {
        #expect(Depth.allCases.contains(.backward))
    }

    @Test(arguments: [Depth.forward, Depth.backward])
    func `Depth equality is reflexive`(depth: Depth) {
        #expect(depth == depth)
    }

    @Test
    func `Depth inequality is symmetric for distinct cases`() {
        #expect(Depth.forward != Depth.backward)
        #expect(Depth.backward != Depth.forward)
    }

    @Test
    func `Sets distinguish the two Depth cases`() {
        let set: Set<Depth> = [.forward, .backward, .forward]
        #expect(set.count == 2)
    }

    @Test(arguments: [Depth.forward, Depth.backward])
    func `Depth descriptions name a valid case`(depth: Depth) {
        let desc = depth.description
        #expect(desc == "forward" || desc == "backward")
    }
}

@Suite
struct `Depth negation exchanges cases and is involutive` {
    @Test(arguments: [Depth.forward, Depth.backward])
    func `negation operator is involution`(depth: Depth) {
        #expect(!(!depth) == depth)
    }

    @Test
    func `negation maps forward to backward`() {
        #expect(!Depth.forward == .backward)
    }

    @Test
    func `negation maps backward to forward`() {
        #expect(!Depth.backward == .forward)
    }
}
