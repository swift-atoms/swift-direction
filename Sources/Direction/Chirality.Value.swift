public import Pair

extension Chirality {

    public typealias Value<Payload: ~Copyable & ~Escapable> = Pair<Chirality, Payload>
}
