import Observation

/// Signed-in state, held in memory only and reset on relaunch (D-020).
@Observable
final class SessionStore {
    private(set) var isSignedIn: Bool

    init(isSignedIn: Bool = false) {
        self.isSignedIn = isSignedIn
    }

    /// Account button text: Sign in, or My Larder once signed in.
    var accountLabel: String {
        isSignedIn ? BrandCopy.accountTab : "Sign in"
    }

    func signIn() {
        isSignedIn = true
    }

    func signOut() {
        isSignedIn = false
    }
}
