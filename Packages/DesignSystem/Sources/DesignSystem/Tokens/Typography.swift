import CoreText
import SwiftUI

// Type tokens. Body text uses the system text styles directly so Dynamic
// Type works with no wrapper (Design System Spec, Text styles):
//
// Figma text style              -> SwiftUI
// iOS/Title 3/Semibold          -> .title3.weight(.semibold)
// iOS/Headline/Semibold         -> .headline
// iOS/Body/Regular              -> .body
// iOS/Callout/Semibold          -> .callout.weight(.semibold)
// iOS/Subheadline/Regular       -> .subheadline
// iOS/Footnote/Regular          -> .footnote
// iOS/Caption/Regular           -> .caption
// Brand/Headline 28             -> Font.brandHeadline28 (hero title only)
// Brand/Headline 25             -> Font.brandHeadline25 (promo headline only)
//
// The brand serif is Lora Bold, SIL Open Font License 1.1 (Resources/Fonts/OFL.txt),
// from https://github.com/cyrealtype/Lora-Cyrillic.

public extension Font {
    /// `Brand/Headline 28`: Lora Bold 28 pt, scaling with `.title`.
    static var brandHeadline28: Font {
        BrandFont.lora(size: 28, relativeTo: .title)
    }

    /// `Brand/Headline 25`: Lora Bold 25 pt, scaling with `.title2`.
    static var brandHeadline25: Font {
        BrandFont.lora(size: 25, relativeTo: .title2)
    }
}

/// Registers the bundled Lora file with CoreText on first use. Runtime
/// registration replaces the `UIAppFonts` Info.plist key, which a package
/// cannot set.
enum BrandFont {
    /// PostScript name inside Lora-Bold.ttf.
    static let loraBold = "Lora-Bold"

    static func lora(size: CGFloat, relativeTo style: Font.TextStyle) -> Font {
        _ = isRegistered
        return .custom(loraBold, size: size, relativeTo: style)
    }

    /// Runs once, the first time it is read.
    static let isRegistered: Bool = {
        guard let url = Bundle.module.url(forResource: loraBold, withExtension: "ttf") else {
            assertionFailure("Lora-Bold.ttf is missing from the DesignSystem bundle")
            return false
        }
        var error: Unmanaged<CFError>?
        let registered = CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
        if !registered {
            assertionFailure("Lora-Bold.ttf did not register: \(String(describing: error?.takeRetainedValue()))")
        }
        return registered
    }()
}
