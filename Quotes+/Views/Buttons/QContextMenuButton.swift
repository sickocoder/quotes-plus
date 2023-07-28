//
//  QContextMenuButton.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI

struct QContextMenuButton: View {
  var title: String
  var systemImage: String
  var onPress: () -> ()
  
  var body: some View {
    Button {
      onPress()
    } label: {
      Label(title, systemImage: systemImage)
    }
  }
}

#Preview {
  QContextMenuButton(
    title: "Add to favorities",
    systemImage: "star"
  ) {}
}
