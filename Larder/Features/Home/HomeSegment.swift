import Foundation

/// The two Home views switched in place by the segmented Picker.
enum HomeSegment: CaseIterable {
    case groceries
    case inspiration

    var title: String {
        switch self {
        case .groceries: "Groceries"
        case .inspiration: "Inspiration"
        }
    }
}
