import Testing

@testable import Direction

@Suite
struct `Chirality opposition exchanges its two cases` {
    @Test(arguments: [Chirality.left, Chirality.right])
    func `opposite is involution`(chirality: Chirality) {
        #expect(Chirality.opposite(of: Chirality.opposite(of: chirality)) == chirality)
    }

    @Test
    func `opposite maps left to right`() {
        #expect(Chirality.opposite(of: .left) == .right)
    }

    @Test
    func `opposite maps right to left`() {
        #expect(Chirality.opposite(of: .right) == .left)
    }
}

@Suite
struct `Chirality properties preserve case identity and directional meaning` {
    @Test(arguments: [Chirality.left, Chirality.right])
    func `opposite property delegates to static function`(chirality: Chirality) {
        #expect(chirality.opposite == Chirality.opposite(of: chirality))
    }

    @Test(arguments: [Chirality.left, Chirality.right])
    func `mirrored is alias for opposite`(chirality: Chirality) {
        #expect(chirality.mirrored == chirality.opposite)
    }

    @Test
    func `Standard chirality uses the right handed coordinate system`() {
        #expect(Chirality.standard == .right)
    }

    @Test
    func `DirectX chirality uses the left handed coordinate system`() {
        #expect(Chirality.directX == .left)
    }
}

@Suite
struct `Chirality negation exchanges cases and is involutive` {
    @Test(arguments: [Chirality.left, Chirality.right])
    func `negation operator is involution`(chirality: Chirality) {
        #expect(!(!chirality) == chirality)
    }

    @Test
    func `negation maps left to right`() {
        #expect(!Chirality.left == .right)
    }

    @Test
    func `negation maps right to left`() {
        #expect(!Chirality.right == .left)
    }
}

@Suite
struct `Chirality cases support enumeration equality and hashing` {
    @Test
    func `allCases contains exactly two cases`() {
        #expect(Chirality.allCases.count == 2)
    }

    @Test
    func `allCases contains left`() {
        #expect(Chirality.allCases.contains(.left))
    }

    @Test
    func `allCases contains right`() {
        #expect(Chirality.allCases.contains(.right))
    }

    @Test(arguments: [Chirality.left, Chirality.right])
    func `Chirality equality is reflexive`(chirality: Chirality) {
        #expect(chirality == chirality)
    }

    @Test
    func `Chirality inequality is symmetric for distinct cases`() {
        #expect(Chirality.left != Chirality.right)
        #expect(Chirality.right != Chirality.left)
    }

    @Test
    func `Sets distinguish the two Chirality cases`() {
        let set: Set<Chirality> = [.left, .right, .left]
        #expect(set.count == 2)
    }
}
