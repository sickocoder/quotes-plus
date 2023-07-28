//
//  QColorPicker.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QColorPicker: View {
  @Binding var selectedColorID: String
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(availableQuoteColors) { colorConfig in
          QColorPill(selectedColorQuoteID: selectedColorID, colorConfig: colorConfig) { color in
            withAnimation {
              selectedColorID = color.id
            }
          }
        }
      }
      .padding(.horizontal)
      .padding(.vertical, 2)
      .padding(.top)
    }
  }
}

#Preview {
  QColorPicker(selectedColorID: .constant(availableQuoteColors[0].id))
}


