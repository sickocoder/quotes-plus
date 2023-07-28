//
//  QAppleButton.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI

struct QAppleButton: View {
  var onPress: () -> ()
  
  var body: some View {
    Button {
      onPress()
    } label: {
      Image(systemName: "apple.logo")
        .imageScale(.large)
    }
    .buttonStyle(.borderless)
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color.black.opacity(0.1), lineWidth: 1)
    )
  }
}

#Preview {
  QAppleButton {
    print("pressed apple")
  }
}

