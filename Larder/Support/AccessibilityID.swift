import Foundation

/// Stable identifiers for UI tests. Kebab-case, never shown or spoken.
enum AccessibilityID {
    static let tabHome = "tab-home"
    static let tabSearch = "tab-search"
    static let tabAccount = "tab-account"
    static let tabFavourites = "tab-favourites"
    static let tabTrolley = "tab-trolley"

    static let accountButton = "account-button"
    static let accountSheet = "account-sheet"
    static let accountSheetClose = "account-sheet-close"
    static let signInButton = "sign-in-button"
    static let signOutButton = "sign-out-button"

    static let homeSegmentPicker = "home-segment-picker"

    static func homeRoute(_ route: HomeRoute) -> String {
        switch route {
        case .bookSlot: "home-route-book-slot"
        case .scanCard: "home-route-scan-card"
        case .vouchers: "home-route-vouchers"
        case .orders: "home-route-orders"
        case .recipes: "home-route-recipes"
        case .scanAndGo: "home-route-scan-and-go"
        }
    }

    /// Every identifier, for the uniqueness test.
    static var all: [String] {
        [
            tabHome, tabSearch, tabAccount, tabFavourites, tabTrolley,
            accountButton, accountSheet, accountSheetClose, signInButton, signOutButton,
            homeSegmentPicker,
        ] + HomeRoute.allCases.map { homeRoute($0) }
    }
}
