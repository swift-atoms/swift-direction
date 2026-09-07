import Direction
import Testing

@Suite
struct `Directions order negative before positive` {
    @Test
    func `negative sorts before positive`() {
        #expect([Direction.positive, .negative].sorted() == [.negative, .positive])
    }
}
