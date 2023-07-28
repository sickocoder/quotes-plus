//
//  QuoteCard.swift
//  Quotes+
//
//  Created by José Tony on 22/07/23.
//

import SwiftUI

struct QuoteCard: View {
  var quoteConfig: QuoteModel
  var showQuotes: Bool = false
  var isInExportMode: Bool = false
  
  private var quoteColor: QuoteColor {
    quoteConfig.getBackgroundColor()
  }
  
    var body: some View {
      ZStack {
        Group {
          if quoteColor.isGradient {
            quoteColor.gradient
          } else {
            quoteColor.color
          }
        }
        .clipShape(RoundedRectangle(cornerRadius: isInExportMode ? 0 : 12))
        
        VStack(alignment: .leading) {
          if showQuotes {
            Image(systemName: "quote.opening")
              .font(.system(size: 40))
              .fontWeight(.bold)
          }
          
          Text(quoteConfig.quoteText)
            .multilineTextAlignment(TextAlignment.from(alignment: Alignment.from(text: quoteConfig.textAlign)))
            .font(quoteConfig.fontFamily.lowercased() == "default" ?
              .system(size: CGFloat(quoteConfig.fontSize)) :
              .custom(quoteConfig.fontFamily, size: CGFloat(quoteConfig.fontSize))
            )
            .fontWeight(textStyleImage[quoteConfig.fontWeight] ?? .medium)
            .italic(quoteConfig.fontWeight == "italic")
            .frame(maxWidth: .infinity, alignment: Alignment.from(text: quoteConfig.textAlign))
            .padding(.vertical, showQuotes ? (isInExportMode ? 60 : 30) : 0)
          
          if showQuotes {
            HStack {
              Spacer()
              Image(systemName: "quote.closing")
                .font(.system(size: 40))
                .fontWeight(.bold)
            }
          }
        }
        .foregroundStyle(.white)
        .padding(40)
        
        if quoteConfig.isFavorite {
          VStack {
            HStack {
              Spacer()
              
              Image(systemName: "star.fill")
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
                .opacity(0.4)
            }
            Spacer()
          }
          .padding()
        }
      }
      .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    QuoteCard(quoteConfig: dumbQuote)
}
