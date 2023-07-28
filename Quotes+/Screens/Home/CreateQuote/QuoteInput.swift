//
//  QuoteInputScreen.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

struct QuoteInput: View {
  @Binding var quoteConfig: QuoteModel
  var selectedColor: QuoteColor {
    quoteConfig.getBackgroundColor()
  }
  
  @Binding var isShowingStyling: Bool
  let animation: Namespace.ID
  
  @FocusState private var focused: Bool?
  
  var body: some View {
    ZStack {
      Group {
        if selectedColor.isGradient {
          selectedColor.gradient
        } else {
          selectedColor.color
        }
      }.ignoresSafeArea(.all)
      
      VStack {
        Spacer()
        
        TextField("write the quote", text: $quoteConfig.quoteText, axis: .vertical)
          .font(.title)
          .multilineTextAlignment(.center)
          .tint(.white)
          .foregroundStyle(.white)
          .padding()
          .padding(.horizontal, 50)
          .focused($focused, equals: true)
          .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
              self.focused = true
            }
          }
        
        Spacer()
        QColorPicker(selectedColorID: $quoteConfig.backgroundColorID)
        
        Button {
          self.dismissKeyboard()
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.spring()) {
              $isShowingStyling.wrappedValue.toggle()
            }
          }
         
         
        } label: {
          HStack {
            Text("Style The Quote")
              .fontWeight(.bold)
              .frame(maxWidth: .infinity)
          }
        }
        .controlSize(.large)
        .buttonStyle(.bordered)
        .tint(.white)
        .padding()
        .opacity(quoteConfig.quoteText.isEmpty ? 0.4 : 1)
      }
    }
    .matchedGeometryEffect(id: AnimationID.hero, in: animation, anchor: .top)
  }
}

struct QuoteInput_Previews: PreviewProvider {
  struct TestQuoteInput: View {
    @Namespace var animation
    var body: some View {
      QuoteInput(
        quoteConfig: .constant(dumbQuote),
        isShowingStyling: .constant(false),
        animation: animation
      )
    }
  }
  
  static var previews: some View {
    TestQuoteInput()
  }
}
