import Pair
import Testing

@testable import Chirality

@Suite
struct `Chirality - Value Typealias` {

    struct Payload: ~Copyable {
        let value: Int
    }

    @Test
    func `Value typealias for Pair`() {
        let paired: Chirality.Value<String> = Pair(.left, "hand")
        #expect(paired.first == .left)
        #expect(paired.second == "hand")
    }

    @Test
    func `Value is Pair type`() {
        let value: Chirality.Value<Int> = Pair(.right, 42)
        #expect(value.first == .right)
        #expect(value.second == 42)
    }

    @Test
    func `Value accepts noncopyable payloads`() {
        let value: Chirality.Value<Payload> = Pair(.right, Payload(value: 42))
        let matches = value.apply { chirality, payload in
            chirality == .right && payload.value == 42
        }

        #expect(matches)
    }
}
