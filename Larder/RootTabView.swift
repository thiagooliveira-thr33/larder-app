import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Search", systemImage: "magnifyingglass") {
                StubScreen(title: "Search", systemImage: "magnifyingglass")
            }
            Tab(BrandCopy.accountTab, systemImage: "person.crop.circle") {
                StubScreen(title: BrandCopy.accountTab, systemImage: "person.crop.circle")
            }
            Tab("Favourites", systemImage: "heart") {
                StubScreen(title: "Favourites", systemImage: "heart")
            }
            Tab("Trolley", systemImage: "cart") {
                StubScreen(title: "Trolley", systemImage: "cart")
            }
        }
    }
}

#Preview {
    RootTabView()
        .environment(SessionStore())
}
