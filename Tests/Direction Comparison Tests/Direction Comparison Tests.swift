import Direction
import Direction_Comparison
import Testing

@Suite
struct `Direction Comparison Tests` {
    @Test
    func `negative sorts before positive`() {
        #expect([Direction.positive, .negative].sorted() == [.negative, .positive])
    }
}
