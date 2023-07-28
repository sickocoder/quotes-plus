//
//  QTextSize.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QTextSize: View {
  @Binding var selectedSize: Float
  var selectedColor: QuoteColor
  
  var body: some View {
    HStack {
      ForEach(Array(availableTextSizes.keys), id: \.self) { key in
        Button(key) {
          withAnimation {
            selectedSize = availableTextSizes[key] ?? 20
          }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .foregroundStyle(.white)
        .setBackground(
          shouldApply: selectedSize == (availableTextSizes[key] ?? 20),
          isGradient: selectedColor.isGradient,
          gradient: selectedColor.gradient,
          color: selectedColor.color
        )
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
      }
    }
  }
}

#Preview {
  QTextSize(selectedSize: .constant(20), selectedColor: availableQuoteColors[0])
}


