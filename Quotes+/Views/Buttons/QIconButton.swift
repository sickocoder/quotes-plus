//
//  QIconButton.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI

struct QIconButton: View {
  var systemName: String
  var onPress: () -> ()
    var body: some View {
      Button {
        onPress()
      } label: {
        Image(systemName: systemName)
      }
    }
}

#Preview {
  QIconButton(systemName: "star") {}
}
