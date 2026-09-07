import Direction
import Testing

@Suite
struct `Direction cases remain distinct in sets` {
    @Test
    func `directions are distinct set elements`() {
        let values: Set<Direction> = [.positive, .negative, .positive]
        #expect(values.count == 2)
    }
}
