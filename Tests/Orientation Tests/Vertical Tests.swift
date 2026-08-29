import Testing

@testable import Orientation

@Suite
struct `Vertical Tests` {

    @Test(arguments: [Vertical.upward, Vertical.downward])
    func `opposite is intrinsic and involutive`(_ value: Vertical) {
        #expect(value.opposite == Vertical.opposite(of: value))
        #expect(value.opposite.opposite == value)
    }

    @Test
    func `directional predicates describe cases`() {
        #expect(Vertical.upward.isUpward)
        #expect(!Vertical.upward.isDownward)
        #expect(Vertical.downward.isDownward)
        #expect(!Vertical.downward.isUpward)
    }

    @Test
    func `intrinsic conformances remain available`() {
        #expect(Vertical.allCases == [.upward, .downward])
        #expect(Vertical.upward.description == "upward")
        #expect(Vertical.downward.description == "downward")
    }
}
