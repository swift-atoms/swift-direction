import Direction
import Testing

@Test
func `Named orientations need only the Direction import`() {
    let horizontal: Horizontal = .rightward
    let vertical: Vertical = .upward
    let depth: Depth = .forward
    let temporal: Temporal = .future

    #expect(horizontal.opposite == .leftward)
    #expect(vertical.opposite == .downward)
    #expect(depth.opposite == .backward)
    #expect(temporal.opposite == .past)
    #expect(horizontal.isRightward && vertical.isUpward)
    #expect(depth.isForward && temporal.isFuture)
}
