import Pair
import Testing

@testable import Direction

@Suite
struct `Winding values pair their case with a payload` {
    @Test
    func `Winding value aliases preserve both pair components`() {
        let paired: Winding.Value<Double> = Pair(.clockwise, 3.14)
        #expect(paired.first == .clockwise)
        #expect(paired.second == 3.14)
    }

    @Test
    func `Value is Pair type`() {
        let value: Winding.Value<Double> = Pair(.ccw, 45.0)
        #expect(value.first == .counterclockwise)
        #expect(value.second == 45.0)
    }
}
