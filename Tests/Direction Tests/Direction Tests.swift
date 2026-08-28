import Direction
import Testing

@Suite
struct `Direction Tests` {
    @Test(arguments: [Direction.positive, Direction.negative])
    func `opposite is involutive`(_ direction: Direction) {
        #expect(direction.opposite.opposite == direction)
    }

    @Test
    func `sign initializer selects a direction`() {
        #expect(Direction(sign: -1) == .negative)
        #expect(Direction(sign: 0) == .positive)
    }
}
