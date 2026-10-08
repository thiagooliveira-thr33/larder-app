import SwiftUI

// Color tokens. Values live in Resources/Colors.xcassets with light and dark
// appearances, copied from the Figma variables in `Waitrose Semantic Colors`
// (Design System Spec, 2026-10-08). There is no glass token (D-002).
//
// Figma variable           -> Swift
// color/brand-accent       -> Color.brandAccent
// color/screen-background  -> Color.screenBackground   (was home-background, D-025)
// color/grouped-surface    -> Color.groupedSurface
// color/surface-elevated   -> Color.surfaceElevated
// color/chip-background    -> Color.chipBackground
// color/feature-band       -> Color.featureBand
// color/label-primary      -> Color.labelPrimary        (not Color.primary, D-003)
// color/label-secondary    -> Color.labelSecondary      (not Color.secondary, D-003)
// color/label-on-image     -> Color.labelOnImage
// color/label-on-accent    -> Color.labelOnAccent
// color/label-on-seasonal  -> Color.labelOnSeasonal
// color/separator-line     -> Color.separatorLine       (not separator, D-025)
// color/destructive        -> Color.destructive
// color/seasonal-red       -> Color.seasonalRed         (promotional content only)
// color/image-scrim        -> Color.imageScrim
//
// `token("name")` uses the ColorResource symbols Xcode generates from the
// asset catalog, so a misspelt token is a compile error, not a clear color.

public extension Color {
    static let brandAccent = token("brandAccent")
    static let screenBackground = token("screenBackground")
    static let groupedSurface = token("groupedSurface")
    static let surfaceElevated = token("surfaceElevated")
    static let chipBackground = token("chipBackground")
    static let featureBand = token("featureBand")
    static let labelPrimary = token("labelPrimary")
    static let labelSecondary = token("labelSecondary")
    static let labelOnImage = token("labelOnImage")
    static let labelOnAccent = token("labelOnAccent")
    static let labelOnSeasonal = token("labelOnSeasonal")
    static let separatorLine = token("separatorLine")
    static let destructive = token("destructive")
    static let seasonalRed = token("seasonalRed")
    static let imageScrim = token("imageScrim")
}

private extension Color {
    static func token(_ name: String) -> Color {
        Color(name, bundle: .module)
    }
}
