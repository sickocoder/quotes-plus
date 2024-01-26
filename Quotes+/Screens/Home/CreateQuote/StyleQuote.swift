//
//  StyleQuote.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI
import UIKit

struct StyleQuote: View {
  @Environment(\.modelContext) private var modelContext
  @Environment(\.presentationMode) var presentationMode
  
  @Environment(\.displayScale) var displayScale
  
  @Bindable var quoteConfig: QuoteModel
  
  @State private var shouldShowContent: Bool = false
  @State private var sheetPresented : Bool = false
  
  let animation: Namespace.ID
  var selectedColor: QuoteBackground {
    quoteConfig.getBackgroundColor()
  }
  
  var body: some View {
    ScrollView(showsIndicators: false) {
      QuoteCard(
        quoteConfig: quoteConfig,
        showQuotes: true,
        isInExportMode: true
      )
      .padding(.horizontal)
      .matchedGeometryEffect(id: AnimationID.hero, in: animation, anchor: .top)
      .onTapGesture {
        withAnimation(.spring()) {
          $shouldShowContent.wrappedValue.toggle()
        }
      }
      
      VStack {
        QBackgroundPicker(selectedColorID: $quoteConfig.backgroundColorID)
        
        VStack {
          Divider()
          HStack(spacing: 16) {
            QTextAlign(
              selectedAlignment: $quoteConfig.textAlign,
              selectedColor: selectedColor
            )
            
            Spacer()
            Divider().padding(.horizontal)
            Spacer()
            
            QTextStyle(
              selectedStyle: $quoteConfig.fontWeight,
              selectedColor: selectedColor
            )
          }
          .padding(.vertical, 8)
          .padding(.horizontal)
          
          Divider()
          
          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              QTextSize(
                selectedSize: $quoteConfig.fontSize,
                selectedColor: selectedColor
              )
            }
            .padding(.horizontal)
          }
          .padding(.vertical, 6)
          
          Divider()
          
          QFonstPicker(
            selectedColorConfig: selectedColor,
            selectedFont: quoteConfig.fontFamily
          ) { font in
              withAnimation { quoteConfig.fontFamily = font }
          }
          .padding(.vertical, 6)
          .padding(.horizontal)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.vertical)
      .opacity(shouldShowContent ? 1 : 0)
    }
    .toolbar {
      HStack(alignment: .center) {
        Button("Save") {
          modelContext.insert(quoteConfig)
          presentationMode.wrappedValue.dismiss()
        }
        
        QIconButton(systemName: "square.and.arrow.up") {
          modelContext.insert(quoteConfig)
          sheetPresented.toggle()
        }
      }
    }
    .toolbar(.hidden, for: .tabBar)
    .onAppear {
      withAnimation(.easeInOut(duration: 1)) {
        shouldShowContent.toggle()
      }
    }
    .sheet(isPresented: $sheetPresented, content: {
      if let data = render() {
        ShareView(activityItems: [data])
      }
    })
  }
}

struct Style_Previews: PreviewProvider {
  struct TestQuoteInput: View {
    @Namespace var animation
    var body: some View {
      StyleQuote(
        quoteConfig: dumbQuote,
        animation: animation
      )
    }
  }
  
  static var previews: some View {
    TestQuoteInput()
  }
}


