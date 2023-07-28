//
//  QGoogleButton.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI

struct QGoogleButton: View {
  var onPress: () -> ()
  
  var body: some View {
    Button {
      onPress()
    } label: {
      HStack {
        Spacer()
        
        Text("Entrar com o Google")
          .bold()
        
        Spacer()
      }
    }
    .buttonStyle(.borderless)
    .padding()
    .frame(height: 56)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .stroke(Color.black.opacity(0.1), lineWidth: 1)
    )
  }
}

#Preview {
  QGoogleButton {}
}

