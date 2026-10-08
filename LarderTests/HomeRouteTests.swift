import Testing
@testable import Larder

@MainActor
struct HomeRouteTests {
    @Test func quickActionsFollowSpecOrder() {
        #expect(HomeRoute.quickActions.map(\.title) == ["Book slot", "Scan card", "Vouchers", "Orders", "Recipes"])
    }

    @Test func everyRouteHasAUniqueTitleAndSymbol() {
        let routes = HomeRoute.allCases
        #expect(routes.count == 6)
        #expect(Set(routes.map(\.title)).count == routes.count)
        #expect(routes.allSatisfy { !$0.systemImage.isEmpty })
    }

    @Test func scanAndGoUsesBrandCopy() {
        #expect(HomeRoute.scanAndGo.title == BrandCopy.scanAndGo)
    }
}
