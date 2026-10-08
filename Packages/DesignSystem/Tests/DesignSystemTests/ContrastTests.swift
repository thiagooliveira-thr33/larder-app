import SwiftUI
import Testing
import DesignSystem

/// WCAG 2 contrast for the text and surface pairs the Design System Spec
/// and SPEC-001 use, in light and dark. Body text needs 4.5:1, large text
/// (Lora headlines, 18 pt bold and up) needs 3:1. Values are owned by Figma:
/// a failure is reported, never fixed here.
struct ContrastTests {
    struct Pair: CustomTestStringConvertible, Sendable {
        let text: String
        let foreground: Color
        let background: String
        let surface: Color
        let minimum: Double
        var testDescription: String { "\(text) on \(background)" }
    }

    static let body = 4.5
    static let large = 3.0

    static let pairs: [Pair] = [
        Pair(text: "labelPrimary", foreground: .labelPrimary, background: "screenBackground", surface: .screenBackground, minimum: body),
        Pair(text: "labelPrimary", foreground: .labelPrimary, background: "groupedSurface", surface: .groupedSurface, minimum: body),
        Pair(text: "labelPrimary", foreground: .labelPrimary, background: "surfaceElevated", surface: .surfaceElevated, minimum: body),
        Pair(text: "labelPrimary", foreground: .labelPrimary, background: "chipBackground", surface: .chipBackground, minimum: body),
        Pair(text: "labelPrimary", foreground: .labelPrimary, background: "featureBand", surface: .featureBand, minimum: body),
        Pair(text: "labelSecondary", foreground: .labelSecondary, background: "screenBackground", surface: .screenBackground, minimum: body),
        Pair(text: "labelSecondary", foreground: .labelSecondary, background: "groupedSurface", surface: .groupedSurface, minimum: body),
        Pair(text: "labelSecondary", foreground: .labelSecondary, background: "surfaceElevated", surface: .surfaceElevated, minimum: body),
        Pair(text: "labelSecondary", foreground: .labelSecondary, background: "featureBand", surface: .featureBand, minimum: body),
        Pair(text: "brandAccent", foreground: .brandAccent, background: "screenBackground", surface: .screenBackground, minimum: body),
        Pair(text: "brandAccent", foreground: .brandAccent, background: "surfaceElevated", surface: .surfaceElevated, minimum: body),
        Pair(text: "labelOnAccent", foreground: .labelOnAccent, background: "brandAccent", surface: .brandAccent, minimum: body),
        Pair(text: "labelOnImage", foreground: .labelOnImage, background: "seasonalRed", surface: .seasonalRed, minimum: body),
        Pair(text: "labelOnSeasonal", foreground: .labelOnSeasonal, background: "seasonalRed", surface: .seasonalRed, minimum: large),
        Pair(text: "labelOnImage", foreground: .labelOnImage, background: "imageScrim over white", surface: .imageScrim, minimum: body),
        Pair(text: "destructive", foreground: .destructive, background: "groupedSurface", surface: .groupedSurface, minimum: body),
    ]

    @Test(arguments: pairs, [ColorScheme.light, .dark])
    func meetsTheWCAGMinimum(_ pair: Pair, _ scheme: ColorScheme) {
        let ratio = Contrast.ratio(pair.foreground, on: pair.surface, in: scheme)
        #expect(ratio >= pair.minimum, "\(pair.testDescription), \(scheme): \(String(format: "%.2f", ratio)):1")
    }
}

enum Contrast {
    /// Contrast ratio of `foreground` on `background`. A translucent
    /// background is composited over white, the worst case for light text
    /// on a scrim over photography.
    static func ratio(_ foreground: Color, on background: Color, in scheme: ColorScheme) -> Double {
        let back = composite(Hex.resolve(background, in: scheme), over: (1, 1, 1))
        let front = composite(Hex.resolve(foreground, in: scheme), over: back)
        let lighter = max(luminance(front), luminance(back))
        let darker = min(luminance(front), luminance(back))
        return (lighter + 0.05) / (darker + 0.05)
    }

    typealias RGB = (Double, Double, Double)

    static func composite(_ color: Color.Resolved, over base: RGB) -> RGB {
        let alpha = Double(color.opacity)
        return (Double(color.red) * alpha + base.0 * (1 - alpha),
                Double(color.green) * alpha + base.1 * (1 - alpha),
                Double(color.blue) * alpha + base.2 * (1 - alpha))
    }

    /// WCAG 2 relative luminance of gamma-encoded sRGB components.
    static func luminance(_ rgb: RGB) -> Double {
        func linear(_ c: Double) -> Double {
            c <= 0.04045 ? c / 12.92 : pow((c + 0.055) / 1.055, 2.4)
        }
        return 0.2126 * linear(rgb.0) + 0.7152 * linear(rgb.1) + 0.0722 * linear(rgb.2)
    }
}
