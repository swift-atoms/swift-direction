import Testing

@testable import Direction

enum `Winding.Number Tests` {}

extension `Winding.Number Tests` {
    @Suite
    struct `Winding numbers are signed counts of turns` {
        @Test
        func `A number keeps the turns it was built from`() {
            #expect(Winding.Number(Int8(-3)).turns == -3)
            #expect((2 as Winding.Number).turns == 2)
            #expect(Winding.Number.zero.turns == 0)
        }

        @Test
        func `Numbers add and subtract as their turns do`() {
            let two: Winding.Number = 2
            let three: Winding.Number = 3
            #expect(two + three == 5)
            #expect(two - three == -1)
            #expect(two + .zero == two)
        }

        @Test
        func `Negation reverses the count`() {
            let two: Winding.Number = 2
            #expect(-two == Winding.Number(-2))
            #expect(-(-two) == two)
            #expect(two + -two == .zero)
        }

        @Test
        func `Numbers order as their turns do`() {
            #expect((-1 as Winding.Number) < 0)
            #expect((0 as Winding.Number) < 1)
            #expect(!((1 as Winding.Number) < 1))
        }
    }
}
