//
//  QTextAlign.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QTextAlign: View {
  @Binding var selectedAlignment: String
  var selectedColor: QuoteBackground
  
  var body: some View {
    ForEach(textAligmentToImage, id: \.self) { key in
      QImageButton(alignment: Alignment.from(text: key)) { aligment in
        withAnimation {
          selectedAlignment = key
        }
      }
      .setTint(
        shouldApply: key == selectedAlignment,
        gradient: (selectedColor as? QuoteGradientBG)?.gradient,
				color: (selectedColor as? QuoteBasicBGColor)?.color
      )
    }
  }
}

#Preview {
  QTextAlign(selectedAlignment: .constant("text.aligncenter"), selectedColor: availableQuoteColors[0])
}




