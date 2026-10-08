import Testing
@testable import Larder

@MainActor
struct HomeSegmentTests {
    @Test func segmentsFollowSpecOrder() {
        #expect(HomeSegment.allCases.map(\.title) == ["Groceries", "Inspiration"])
    }
}
