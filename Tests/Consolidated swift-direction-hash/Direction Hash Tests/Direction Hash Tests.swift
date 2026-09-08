import Direction
import Hash
import Testing

@Suite
struct `Direction Hash Integration` {

    @Test
    func `Direction is natively hashable through the seam`() {
        let values: Set<Direction> = [.positive, .negative, .positive]

        #expect(values.count == 2)
    }

    @Test
    func `Direction supplies Hash's domain-typed value`() {
        func hash<T: Hash.`Protocol`>(_ value: borrowing T) -> Hash.Value {
            value.hashValue
        }

        let first: Hash.Value = hash(Direction.positive)
        let second: Hash.Value = hash(Direction.positive)
        #expect(first == second)
    }
}
