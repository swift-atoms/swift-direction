public import Pair

extension Winding {

    public typealias Value<Payload: ~Copyable & ~Escapable> = Pair<Winding, Payload>
}
