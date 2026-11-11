import Testing

@testable import Direction

enum `Winding.Rule Tests` {}

extension `Winding.Rule Tests` {
    @Suite
    struct `Winding rules decide which winding numbers are inside` {
        @Test(arguments: [-4, -3, -2, -1, 1, 2, 3, 4])
        func `Nonzero contains every number but zero`(turns: Int) {
            #expect(Winding.Rule.nonzero.contains(Winding.Number(turns)))
        }

        @Test(arguments: [-3, -1, 1, 3])
        func `Evenodd contains the odd numbers`(turns: Int) {
            #expect(Winding.Rule.evenodd.contains(Winding.Number(turns)))
        }

        @Test(arguments: [-4, -2, 0, 2, 4])
        func `Evenodd excludes the even numbers`(turns: Int) {
            #expect(!Winding.Rule.evenodd.contains(Winding.Number(turns)))
        }

        @Test(arguments: Winding.Rule.allCases)
        func `No rule contains zero`(rule: Winding.Rule) {
            #expect(!rule.contains(.zero))
        }

        @Test(arguments: Winding.Rule.allCases)
        func `A rule answers the same for a number and its negation`(rule: Winding.Rule) {
            [0, 1, 2, 3, 4].forEach { turns in
                let number = Winding.Number(turns)
                #expect(rule.contains(number) == rule.contains(-number))
            }
        }

        @Test
        func `The two rules are listed nonzero first`() {
            #expect(Winding.Rule.allCases == [.nonzero, .evenodd])
        }
    }
}
