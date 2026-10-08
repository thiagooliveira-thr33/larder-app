import SwiftUI

/// Home tab. Lane 1 placeholder: one block per SPEC-001 section 2 item,
/// replaced by DesignSystem components in Lane 2.
struct HomeView: View {
    private static let sections = [
        "Hero header",
        "Search",
        "Quick actions",
        "Groceries / Inspiration",
        "Seasonal promotion",
        BrandCopy.scanAndGo,
        "Foodie inspiration",
        "Featured this week",
        "Suggested categories",
        "Customers love",
        "Survey",
        "Explore the catalogue",
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(Self.sections, id: \.self) { section in
                        GroupBox(section) {
                            Text("Placeholder")
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview("Light") {
    HomeView()
}

#Preview("Dark") {
    HomeView()
        .preferredColorScheme(.dark)
}

#Preview("AX5") {
    HomeView()
        .dynamicTypeSize(.accessibility5)
}
