//
//  QuoteListView.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI
import SwiftData

struct QuoteListView: View {
  var quotes: [QuoteModel]
  var searchText: String
  
  @Namespace var heroAnimation
  @Environment(\.modelContext) private var modelContext
  
  func makeQuoteCard(_ quote: QuoteModel) -> some View {
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
  
  func makeListItem(_ quote: QuoteModel) -> some View {
    NavigationLink {
      StyleQuote(quoteConfig: quote, animation: heroAnimation)
    } label: {
      makeQuoteCard(quote)
    }
  }
  
  var body: some View {
    SearchabeView(
      searchText: searchText,
      data: quotes,
      predicate: #Predicate<QuoteModel> { quote in
        quote.quoteText.localizedLowercase.contains(searchText.localizedLowercase)
      }
    ) { data in
      ScrollView(.vertical, showsIndicators: false) {
        VStack (spacing: 20) {
          ForEach(data) { makeListItem($0) }
        }
        .padding(.vertical)
      }
    }
  }
}

#Preview {
  QuoteListView(
    quotes: [],
    searchText: ""
  )
}

