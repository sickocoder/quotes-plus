//
//  RootScreen.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI

enum Tab: String {
	case explore = "Explore"
  case yourQuotes = "Your quotes"
  case favorites = "Favorites quotes"
  case profile = "Profile"
}

struct RootScreen: View {
  @State private var selection: Tab = .yourQuotes
  
  var body: some View {
    TabView(selection: $selection) {
			Text("Explore page")
				.tabItem { Image(systemName: "doc.append.fill") }
				.tag(Tab.explore)
			
      HomeScreen()
        .tabItem { Image(systemName: "house.fill") }
        .tag(Tab.yourQuotes)
      
      FavoritesScreen()
        .tabItem { Image(systemName: "star.fill") }
        .tag(Tab.favorites)
      
      Text("fourth one")
        .tabItem { Image(systemName: "person.fill") }
        .tag(Tab.profile)
    }
  }
}

#Preview {
  RootScreen()
    .modelContainer(for: QuoteModel.self)
}

