import SwiftUI

/// Account stub, presented as a sheet with detents (D-005). Signs in or
/// out of the in-memory session (D-020, D-027).
struct AccountSheet: View {
    @Environment(SessionStore.self) private var session
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ContentUnavailableView {
                Label(session.accountLabel, systemImage: "person.crop.circle")
            } description: {
                Text(session.isSignedIn ? "Signed in on this device until the app quits." : "Coming later")
            } actions: {
                if session.isSignedIn {
                    Button("Sign out") {
                        session.signOut()
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                    .accessibilityIdentifier(AccessibilityID.signOutButton)
                } else {
                    Button("Sign in") {
                        session.signIn()
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .accessibilityIdentifier(AccessibilityID.signInButton)
                }
            }
            .accessibilityIdentifier(AccessibilityID.accountSheet)
            .navigationTitle(session.accountLabel)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") { dismiss() }
                        .accessibilityIdentifier(AccessibilityID.accountSheetClose)
                }
            }
        }
    }
}

#Preview("Signed out, light") {
    AccountSheet()
        .environment(SessionStore())
}

#Preview("Signed in, dark") {
    AccountSheet()
        .environment(SessionStore(isSignedIn: true))
        .preferredColorScheme(.dark)
}

#Preview("Signed out, AX5") {
    AccountSheet()
        .environment(SessionStore())
        .dynamicTypeSize(.accessibility5)
}
