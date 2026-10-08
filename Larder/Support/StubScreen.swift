import SwiftUI

/// Placeholder for any destination that is not built yet (D-026).
/// Wraps the native `ContentUnavailableView`, which already handles
/// Dynamic Type, dark mode and VoiceOver grouping.
struct StubScreen: View {
    let title: String
    let systemImage: String

    var body: some View {
        ContentUnavailableView(
            title,
            systemImage: systemImage,
            description: Text("Coming later")
        )
    }
}

#Preview("Light") {
    StubScreen(title: "Trolley", systemImage: "cart")
}

#Preview("Dark") {
    StubScreen(title: "Trolley", systemImage: "cart")
        .preferredColorScheme(.dark)
}

#Preview("AX5") {
    StubScreen(title: "Trolley", systemImage: "cart")
        .dynamicTypeSize(.accessibility5)
}
