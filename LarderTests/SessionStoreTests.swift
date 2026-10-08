import Testing
@testable import Larder

@MainActor
struct SessionStoreTests {
    @Test func startsSignedOut() {
        let session = SessionStore()
        #expect(!session.isSignedIn)
        #expect(session.accountLabel == "Sign in")
    }

    @Test func signInShowsTheBrandAccountLabel() {
        let session = SessionStore()
        session.signIn()
        #expect(session.isSignedIn)
        #expect(session.accountLabel == BrandCopy.accountTab)
    }

    @Test func signOutReturnsToSignIn() {
        let session = SessionStore(isSignedIn: true)
        session.signOut()
        #expect(!session.isSignedIn)
        #expect(session.accountLabel == "Sign in")
    }
}
