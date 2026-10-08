import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            .accessibilityIdentifier(AccessibilityID.tabHome)
            Tab("Search", systemImage: "magnifyingglass") {
                StubScreen(title: "Search", systemImage: "magnifyingglass")
            }
            .accessibilityIdentifier(AccessibilityID.tabSearch)
            Tab(BrandCopy.accountTab, systemImage: "person.crop.circle") {
                StubScreen(title: BrandCopy.accountTab, systemImage: "person.crop.circle")
            }
            .accessibilityIdentifier(AccessibilityID.tabAccount)
            Tab("Favourites", systemImage: "heart") {
                StubScreen(title: "Favourites", systemImage: "heart")
            }
            .accessibilityIdentifier(AccessibilityID.tabFavourites)
            Tab("Trolley", systemImage: "cart") {
                StubScreen(title: "Trolley", systemImage: "cart")
            }
            .accessibilityIdentifier(AccessibilityID.tabTrolley)
        }
    }
}

#Preview {
    RootTabView()
        .environment(SessionStore())
}
