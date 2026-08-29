import Testing

@testable import Orientation

@Suite
struct `Depth Tests` {

    @Test(arguments: [Depth.forward, Depth.backward])
    func `opposite is intrinsic and involutive`(_ value: Depth) {
        #expect(value.opposite == Depth.opposite(of: value))
        #expect(value.opposite.opposite == value)
    }

    @Test
    func `directional predicates describe cases`() {
        #expect(Depth.forward.isForward)
        #expect(!Depth.forward.isBackward)
        #expect(Depth.backward.isBackward)
        #expect(!Depth.backward.isForward)
    }

    @Test
    func `intrinsic conformances remain available`() {
        #expect(Depth.allCases == [.forward, .backward])
        #expect(Depth.forward.description == "forward")
        #expect(Depth.backward.description == "backward")
    }
}
