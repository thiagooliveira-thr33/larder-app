import SwiftUI

/// Sign in stub, presented as a sheet with detents (D-005).
struct AccountSheet: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            StubScreen(title: "Sign in", systemImage: "person.crop.circle")
                .navigationTitle("Sign in")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close") { dismiss() }
                    }
                }
        }
    }
}

#Preview("Light") {
    AccountSheet()
}

#Preview("Dark") {
    AccountSheet()
        .preferredColorScheme(.dark)
}

#Preview("AX5") {
    AccountSheet()
        .dynamicTypeSize(.accessibility5)
}
