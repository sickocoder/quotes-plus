//
//  HomeScreen.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI
import SwiftData

struct HomeScreen: View {
  @State var searchText: String = ""
  @Query var quotes: [QuoteModel]

  var body: some View {
    NavigationStack {
      QuoteListView(quotes: quotes, searchText: searchText)
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


