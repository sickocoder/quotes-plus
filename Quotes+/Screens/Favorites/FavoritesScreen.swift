//
//  FavoritesScreen.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
  @State var searchText: String = ""
  
  @Query(
    filter: #Predicate<QuoteModel> { quote in quote.isFavorite },
    animation: .snappy
  ) var quotes: [QuoteModel]
  
  var body: some View {
    NavigationStack {
      QuoteListView(quotes: quotes, searchText: searchText)
      .navigationTitle(Text("Favorites quotes"))
      .searchable(text: $searchText)
    }
  }
}

#Preview {
  FavoritesScreen()
    .modelContainer(for: QuoteModel.self)
}


