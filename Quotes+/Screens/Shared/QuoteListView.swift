//
//  QuoteListView.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI
import SwiftData

struct QuoteListView: View {
	@Environment(\.displayScale) var displayScale
	
  var quotes: [QuoteModel]
  var searchText: String
  
  @Environment(\.modelContext) private var modelContext
  
  func makeQuoteCard(_ quote: QuoteModel) -> some View {
		QuoteCard(quoteConfig: quote, showQuotes: true, isInExportMode: false)
      .contextMenu {
        QContextMenuButton(
          title: quote.isFavorite ? "Remove from favorites": "Add to favorites",
          systemImage: "star\(quote.isFavorite ? ".fill" : "")"
        ) {
          quote.isFavorite.toggle()
          modelContext.insert(quote)
        }
        
        QContextMenuButton(title: "Delete", systemImage: "trash") {
          modelContext.delete(quote)
        }
      }
      .padding(.horizontal)
  }
  
  func makeListItem(_ quote: QuoteModel) -> some View {
    NavigationLink {
      StyleQuote(quoteConfig: quote)
    } label: {
      makeQuoteCard(quote)
    }
  }
  
  var body: some View {
    SearchabeView(
      searchText: searchText,
      data: quotes,
      predicate: #Predicate<QuoteModel> { quote in
        return quote
					.quoteText
					.localizedLowercase
					.contains(searchText.localizedLowercase)
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

