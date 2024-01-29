//
//  CreateQuoteScreen.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI
import Photos

struct CreateQuoteScreen: View {
  @State var isShowingStyling: Bool = false
  
  @State private var quoteConfig: QuoteModel = BASE_QUOTE
  
  @State var quote: String? = ""
  @State var selectedColor: any QuoteBackground = availableQuoteColors[0]
  
  @State var selectedAlignment: Alignment = .leading
  @State var selectedTextStyle: String = "normal"
  @State var selectedSize: String = "small"
  @State var selectedFont: String = "default"
  
  var body: some View {
    ZStack {
      if !isShowingStyling {
        QuoteInput(
          quoteConfig: $quoteConfig,
          isShowingStyling: $isShowingStyling
        )
      } else {
        StyleQuote(
          quoteConfig: quoteConfig
        )
      }
    }
		.onAppear {
			PHPhotoLibrary.requestAuthorization(for: .readWrite) { (status) in
				DispatchQueue.main.async {}
			}

		}
    .toolbar(.hidden, for: .tabBar)
  }
}

#Preview {
  CreateQuoteScreen()
}







