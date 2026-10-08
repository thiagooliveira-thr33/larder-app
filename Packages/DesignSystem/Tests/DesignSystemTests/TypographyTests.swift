import SwiftUI
import Testing
import UIKit
@testable import DesignSystem

/// The bundled Lora Bold registers and its PostScript name matches the one
/// `Font.custom` asks for. A wrong name would silently fall back to SF Pro.
struct TypographyTests {
    @Test func loraBoldRegistersUnderItsPostScriptName() {
        _ = Font.brandHeadline28
        #expect(BrandFont.isRegistered)
        #expect(UIFont(name: BrandFont.loraBold, size: 28) != nil)
    }
}
