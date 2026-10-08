import Foundation

/// Destinations pushed onto the Home stack (D-006). Each is a stub screen
/// until its own spec exists.
enum HomeRoute: Hashable, CaseIterable {
    case bookSlot
    case scanCard
    case vouchers
    case orders
    case recipes
    case scanAndGo

    /// The quick actions row, in SPEC-001 section 2 order.
    static let quickActions: [HomeRoute] = [.bookSlot, .scanCard, .vouchers, .orders, .recipes]

    var title: String {
        switch self {
        case .bookSlot: "Book slot"
        case .scanCard: "Scan card"
        case .vouchers: "Vouchers"
        case .orders: "Orders"
        case .recipes: "Recipes"
        case .scanAndGo: BrandCopy.scanAndGo
        }
    }

    var systemImage: String {
        switch self {
        case .bookSlot: "calendar"
        case .scanCard: "creditcard"
        case .vouchers: "ticket"
        case .orders: "shippingbox"
        case .recipes: "fork.knife"
        case .scanAndGo: "barcode.viewfinder"
        }
    }
}
