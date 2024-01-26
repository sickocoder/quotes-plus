//
//  QColorPill.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QColorPill: View {
  var selectedColorQuoteID: String
  
  var colorConfig: QuoteBackground
  var onPress: (_ color: QuoteBackground) -> ()
  
  private var isSelected: Bool {
    selectedColorQuoteID == colorConfig.id
  }
  
  private var isGradient: Bool {
    colorConfig is QuoteGradientBG
  }
  
  var body: some View {
    Button {
      onPress(colorConfig)
    } label: {
      VStack {}
        .frame(width: 48, height: 48)
				.background(isGradient ? nil : (colorConfig as! QuoteBasicBGColor).color)
        .background(isGradient ? (colorConfig as! QuoteGradientBG).gradient : nil)
        .clipShape(Circle())
        .overlay(
          Circle()
            .stroke(
              .blue.opacity(isSelected ? 1 : 0), lineWidth: 3
            )
        )
    }
  }
}

#Preview {
  QColorPill(
    selectedColorQuoteID: availableQuoteColors[0].id,
    colorConfig: availableQuoteColors[0]
  ) { color in }
}



