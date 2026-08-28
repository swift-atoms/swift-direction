import Direction_Hash
import Testing

@Suite
struct `Direction Hash Tests` {
    @Test
    func `directions are distinct set elements`() {
        let values: Set<Direction> = [.positive, .negative, .positive]
        #expect(values.count == 2)
    }
}
