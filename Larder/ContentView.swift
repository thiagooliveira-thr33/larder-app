import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                Text("Home")
                    .font(.largeTitle)
            }
            Tab("Search", systemImage: "magnifyingglass") {
                Text("Search")
                    .font(.largeTitle)
            }
            Tab(BrandCopy.accountTab, systemImage: "person.crop.circle") {
                Text(BrandCopy.accountTab)
                    .font(.largeTitle)
            }
            Tab("Favourites", systemImage: "heart") {
                Text("Favourites")
                    .font(.largeTitle)
            }
            Tab("Trolley", systemImage: "cart") {
                Text("Trolley")
                    .font(.largeTitle)
            }
        }
    }
}

#Preview {
    ContentView()
}
