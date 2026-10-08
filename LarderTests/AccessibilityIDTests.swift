import Foundation
import Testing
@testable import Larder

@MainActor
struct AccessibilityIDTests {
    @Test func identifiersAreUnique() {
        let ids = AccessibilityID.all
        #expect(Set(ids).count == ids.count)
    }

    @Test func identifiersAreKebabCase() {
        let kebab = /^[a-z0-9]+(-[a-z0-9]+)*$/
        for id in AccessibilityID.all {
            #expect(id.wholeMatch(of: kebab) != nil, "\(id) is not kebab-case")
        }
    }
}
