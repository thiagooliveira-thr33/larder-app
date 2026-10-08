import Testing
import DesignSystem

/// Layout tokens match the Figma `Spacing`, `Radius` and `Size` variables.
struct LayoutTokenTests {
    @Test func spacingFollowsTheFigmaScale() {
        #expect([Spacing.xs, Spacing.sm, Spacing.md, Spacing.lg, Spacing.xl, Spacing.xxl]
            == [4, 8, 16, 24, 32, 48])
    }

    @Test func radiusFollowsTheFigmaScale() {
        #expect([Radius.sm, Radius.md, Radius.lg, Radius.xl, Radius.full]
            == [8, 12, 18, 28, 999])
    }

    @Test func touchTargetIs44() {
        #expect(Size.touchTarget == 44)
    }
}
