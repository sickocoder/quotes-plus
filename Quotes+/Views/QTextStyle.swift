//
//  QTextStyle.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QTextStyle: View {
  @Binding var selectedStyle: String
  var selectedColor: QuoteColor
  
  var body: some View {
    ForEach(Array(textStyleImage.keys), id: \.self) { key in
      Button {
        withAnimation {
          selectedStyle = key
        }
      } label: {
        Group {
          if key == "medium" {
            Text("N")
          } else {
            Image(systemName: key)
          }
        }
        .bold()
        .foregroundStyle(.white)
        .frame(width: 40, height: 40)
        .setBackground(shouldApply: selectedStyle == key, isGradient: selectedColor.isGradient, gradient: selectedColor.gradient, color: selectedColor.color)
        .clipShape(RoundedRectangle(cornerRadius: 8))
      }
    }
  }
}

#Preview {
  QTextStyle(selectedStyle: .constant("normal"), selectedColor: availableQuoteColors[0])
}

