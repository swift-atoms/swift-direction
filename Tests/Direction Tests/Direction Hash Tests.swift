import Direction
import Testing

enum `Direction Hash Tests` {}

extension `Direction Hash Tests` {
    @Suite
    struct `Direction cases remain distinct in sets` {
        @Test
        func `directions are distinct set elements`() {
            let values: Set<Direction> = [.positive, .negative, .positive]
            #expect(values.count == 2)
        }
    }
}
