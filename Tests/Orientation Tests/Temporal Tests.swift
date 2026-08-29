import Testing

@testable import Orientation

@Suite
struct `Temporal Tests` {

    @Test(arguments: [Temporal.future, Temporal.past])
    func `opposite is intrinsic and involutive`(_ value: Temporal) {
        #expect(value.opposite == Temporal.opposite(of: value))
        #expect(value.opposite.opposite == value)
    }

    @Test
    func `directional predicates describe cases`() {
        #expect(Temporal.future.isFuture)
        #expect(!Temporal.future.isPast)
        #expect(Temporal.past.isPast)
        #expect(!Temporal.past.isFuture)
    }

    @Test
    func `intrinsic conformances remain available`() {
        #expect(Temporal.allCases == [.future, .past])
        #expect(Temporal.future.description == "future")
        #expect(Temporal.past.description == "past")
    }
}
