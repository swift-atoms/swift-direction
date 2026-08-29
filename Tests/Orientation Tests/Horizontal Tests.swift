import Testing

@testable import Orientation

@Suite
struct `Horizontal Tests` {

    @Test(arguments: [Horizontal.rightward, Horizontal.leftward])
    func `opposite is intrinsic and involutive`(_ value: Horizontal) {
        #expect(value.opposite == Horizontal.opposite(of: value))
        #expect(value.opposite.opposite == value)
    }

    @Test
    func `directional predicates describe cases`() {
        #expect(Horizontal.rightward.isRightward)
        #expect(!Horizontal.rightward.isLeftward)
        #expect(Horizontal.leftward.isLeftward)
        #expect(!Horizontal.leftward.isRightward)
    }

    @Test
    func `intrinsic conformances remain available`() {
        #expect(Horizontal.allCases == [.rightward, .leftward])
        #expect(Horizontal.rightward.description == "rightward")
        #expect(Horizontal.leftward.description == "leftward")
    }
}
