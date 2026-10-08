import SwiftUI

/// Home tab. Lane 1 placeholder in SPEC-001 section 2 order, replaced by
/// DesignSystem components in Lane 2.
struct HomeView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    placeholder("Hero header")
                    placeholder("Search")
                    GroupBox("Quick actions") {
                        ForEach(HomeRoute.quickActions, id: \.self) { route in
                            routeLink(route)
                        }
                    }
                    placeholder("Groceries / Inspiration")
                    placeholder("Seasonal promotion")
                    GroupBox(BrandCopy.scanAndGo) {
                        routeLink(.scanAndGo)
                    }
                    placeholder("Foodie inspiration")
                    placeholder("Featured this week")
                    placeholder("Suggested categories")
                    placeholder("Customers love")
                    placeholder("Survey")
                    placeholder("Explore the catalogue")
                }
                .padding()
            }
            .navigationTitle("Home")
            .navigationDestination(for: HomeRoute.self) { route in
                StubScreen(title: route.title, systemImage: route.systemImage)
                    .navigationTitle(route.title)
            }
        }
    }

    private func routeLink(_ route: HomeRoute) -> some View {
        NavigationLink(value: route) {
            // System default padding keeps each row above the 44 pt minimum
            // target until C3 brings the Size tokens.
            Label(route.title, systemImage: route.systemImage)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical)
                .contentShape(.rect)
        }
    }

    private func placeholder(_ title: String) -> some View {
        GroupBox(title) {
            Text("Placeholder")
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
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
