//
//  GetStarted.swift
//  Quotes+
//
//  Created by José Tony on 07/07/23.
//

import SwiftUI

struct GetStarted: View {
  var body: some View {
    VStack {
      HStack {
        Text("Comece\nSua Jornada\nCom Palavras")
          .font(.system(size: 46, weight: .heavy))
          .foregroundStyle(Color.primaryApp)
        
        Spacer()
      }
      
      Spacer()
      
      HStack(spacing: 20) {
        QGoogleButton {
          print("pressed")
        }
        
        QAppleButton {
          print("pressed")
        }
      }
      .foregroundStyle(.primaryApp)
      
    }
    .padding(.vertical, 100)
    .padding(.horizontal, 40)
    
  }
}

#Preview {
  GetStarted()
}



