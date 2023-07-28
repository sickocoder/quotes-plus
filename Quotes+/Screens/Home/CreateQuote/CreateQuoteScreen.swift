//
//  CreateQuoteScreen.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI

struct CreateQuoteScreen: View {
  @State var isShowingStyling: Bool = false
  @Namespace var heroAnimation
  
  @State private var quoteConfig: QuoteModel = QuoteModel(
    quoteText: "",
    author: "NA",
    textAlign: "text.aligncenter",
    backgroundColorID: availableQuoteColors[0].id,
    fontFamily: "default",
    fontSize: 20,
    fontWeight: "medium",
    isFavorite: false
  )
  
  @State var quote: String? = ""
  @State var selectedColor: QuoteColor = availableQuoteColors[0]
  
  @State var selectedAlignment: Alignment = .leading
  @State var selectedTextStyle: String = "normal"
  @State var selectedSize: String = "small"
  @State var selectedFont: String = "default"
  
  var body: some View {
    ZStack {
      if !isShowingStyling {
        QuoteInput(
          quoteConfig: $quoteConfig,
          isShowingStyling: $isShowingStyling,
          animation: heroAnimation
        )
      } else {
        StyleQuote(
          quoteConfig: quoteConfig,
          animation: heroAnimation
        )
      }
    }
    .toolbar(.hidden, for: .tabBar)
  }
}

#Preview {
  CreateQuoteScreen()
}







