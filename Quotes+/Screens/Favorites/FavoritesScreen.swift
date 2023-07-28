//
//  FavoritesScreen.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI
import SwiftData

struct FavoritesScreen: View {
  @Namespace var heroAnimation
  
  @State var searchText: String = ""
  @Environment(\.modelContext) private var modelContext
  
  @Query(filter: #Predicate<QuoteModel> { quote in
    quote.isFavorite
  })
  var quotes: [QuoteModel]
  
  
  var filteredQuotes: [QuoteModel] {
    guard !searchText.isEmpty else { return quotes }
    return quotes.filter { quote in
      return quote.quoteText.contains(searchText)
    }
  }
  
  var body: some View {
    NavigationStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack (spacing: 20) {
          ForEach(filteredQuotes) { quote in
            NavigationLink {
              StyleQuote(
                quoteConfig: quote,
                animation: heroAnimation
              )
            } label: {
              QuoteCard(quoteConfig: quote)
                .contextMenu {
                  QContextMenuButton(
                    title: "Remote from favorites",
                    systemImage: "star.fill"
                  ) {
                    quote.isFavorite.toggle()
                    modelContext.insert(quote)
                  }
                  
                  QContextMenuButton(
                    title: "Delete",
                    systemImage: "trash"
                  ) {
                    modelContext.delete(quote)
                  }
                }
                .padding(.horizontal)
              
            }
          }
        }
        .padding(.vertical)
      }
      .navigationTitle(Text("Favorites quotes"))
      .searchable(text: $searchText)
    }
  }
}

#Preview {
  FavoritesScreen()
}


