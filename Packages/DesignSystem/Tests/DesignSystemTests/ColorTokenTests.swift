import SwiftUI
import Testing
import DesignSystem

/// Each public color token resolves from the asset catalog to the value in
/// the Design System Spec (Figma variables, 2026-10-08), in light and dark.
struct ColorTokenTests {
    struct Token: CustomTestStringConvertible, Sendable {
        let name: String
        let color: Color
        let light: String
        let dark: String
        var testDescription: String { name }
    }

    static let tokens: [Token] = [
        Token(name: "brandAccent", color: .brandAccent, light: "173F2F", dark: "B8D532"),
        Token(name: "screenBackground", color: .screenBackground, light: "F7F7F4", dark: "0D1411"),
        Token(name: "groupedSurface", color: .groupedSurface, light: "EFEFEB", dark: "212C27"),
        Token(name: "surfaceElevated", color: .surfaceElevated, light: "FFFFFF", dark: "29342F"),
        Token(name: "chipBackground", color: .chipBackground, light: "EAF2D9", dark: "2D3E35"),
        Token(name: "featureBand", color: .featureBand, light: "EAF2D9", dark: "212C27"),
        Token(name: "labelPrimary", color: .labelPrimary, light: "17201C", dark: "F5F7F5"),
        Token(name: "labelSecondary", color: .labelSecondary, light: "626A66", dark: "B9C0BC"),
        Token(name: "labelOnImage", color: .labelOnImage, light: "FFFFFF", dark: "FFFFFF"),
        Token(name: "labelOnAccent", color: .labelOnAccent, light: "FFFFFF", dark: "0D1411"),
        Token(name: "labelOnSeasonal", color: .labelOnSeasonal, light: "FFF5D9", dark: "FFF5D9"),
        Token(name: "separatorLine", color: .separatorLine, light: "D7DAD7", dark: "39443F"),
        Token(name: "destructive", color: .destructive, light: "C9342C", dark: "FF6961"),
        Token(name: "seasonalRed", color: .seasonalRed, light: "B62337", dark: "CF4152"),
        Token(name: "imageScrim", color: .imageScrim, light: "06110BC4", dark: "000000D9"),
    ]

    @Test(arguments: tokens)
    func resolvesToTheFigmaValue(_ token: Token) {
        #expect(Hex.of(token.color, in: .light) == token.light)
        #expect(Hex.of(token.color, in: .dark) == token.dark)
    }
}

/// Resolves a SwiftUI color to an uppercase RRGGBB hex, plus AA when not opaque.
enum Hex {
    static func of(_ color: Color, in scheme: ColorScheme) -> String {
        let resolved = resolve(color, in: scheme)
        func byte(_ value: Float) -> String {
            String(format: "%02X", Int((value * 255).rounded()))
        }
        let rgb = byte(resolved.red) + byte(resolved.green) + byte(resolved.blue)
        return resolved.opacity < 1 ? rgb + byte(resolved.opacity) : rgb
    }

    static func resolve(_ color: Color, in scheme: ColorScheme) -> Color.Resolved {
        var environment = EnvironmentValues()
        environment.colorScheme = scheme
        return color.resolve(in: environment)
    }
}
