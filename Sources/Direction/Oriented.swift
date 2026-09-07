public import Pair

public typealias Oriented<
    O: Orientation,
    Scalar: ~Copyable & ~Escapable
> = Pair<O, Scalar>

extension Orientation {

    public typealias Value<Scalar: ~Copyable & ~Escapable> = Oriented<Self, Scalar>
}
