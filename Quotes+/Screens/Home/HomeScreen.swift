//
//  HomeScreen.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
  @Namespace var heroAnimation
  @Environment(\.modelContext) private var modelContext
  
  @Query var quotes: [QuoteModel]
  @State var searchText: String = ""
  @State var showCreateFlow: Bool = false
  
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
                    title: quote.isFavorite ? "Remote from favorites": "Add to favorites",
                    systemImage: "star\(quote.isFavorite ? ".fill" : "")"
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
      .navigationTitle(Text("Your quotes"))
      .toolbar {
        HStack {
          NavigationLink {
            CreateQuoteScreen()
          } label: {
            Image(systemName: "plus")
          }
        }
      }
      .searchable(text: $searchText)
    }
  }
}

#Preview {
  HomeScreen()
}

