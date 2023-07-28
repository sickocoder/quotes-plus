//
//  QImageButton.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI
import Collections

struct QImageButton: View {
  var alignment: Alignment
  var onPress: (_ alignment: Alignment) -> ()
  
  var body: some View {
    Button {
      onPress(alignment)
    } label: {
      Image(systemName: Image.iconFrom(alignment: alignment))
        .font(.title)
        .bold()
    }
  }
}

#Preview {
  QImageButton(alignment: .center) { alignment in }
}

