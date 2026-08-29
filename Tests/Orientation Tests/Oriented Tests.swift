import Pair
import Testing

@testable import Orientation

@Suite
struct `Oriented Tests` {

    @Test
    func `orientation Value pairs the orientation with its payload`() {
        let value: Vertical.Value<Double> = Pair(.upward, 1.5)

        #expect(value.first == .upward)
        #expect(value.second == 1.5)
    }
}
