//
//  QuoteInputScreen.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

struct QuoteInput: View {
	@Environment(\.modelContext) private var modelContext
	
	@Binding var quoteConfig: QuoteModel
	var selectedColor: any QuoteBackground {
		quoteConfig.getBackgroundColor()
	}
	
	@Binding var isShowingStyling: Bool
	
	@FocusState private var focused: Bool?
	let screenDimensions = UIScreen.main.bounds.size
	
	var body: some View {
		ZStack {
			VStack {
				Spacer()
				QTextField(text: $quoteConfig.quoteText)
				
				Spacer()
				
				QBackgroundPicker(selectedColorID: $quoteConfig.backgroundColorID) { imageData in
					withAnimation {
						if let imageData = imageData {
							quoteConfig.backgroundImage = QuoteImageBG(imageData: imageData)
						} else {
							quoteConfig.backgroundImage = nil
						}
					}
				}
				
				Button {
					self.dismissKeyboard()
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
						withAnimation(.spring()) {
							$isShowingStyling.wrappedValue.toggle()
						}
					}
				} label: {
					Text("Style The Quote")
						.fontWeight(.bold)
						.frame(maxWidth: .infinity)
				}
				.controlSize(.large)
				.buttonStyle(.bordered)
				.tint(.white)
				.padding()
				.opacity(quoteConfig.quoteText.isEmpty ? 0.4 : 1)
				.disabled(quoteConfig.quoteText.isEmpty)
			}
			.background(QQuoteCardBackground(background: selectedColor, backgroundImage: quoteConfig.backgroundImage, width: screenDimensions.width, fullHeight: true))
		}
		.onAppear {
			modelContext.insert(quoteConfig)
		}
	}
}


//#Preview {
//  @Namespace var heroAnimation
//
//  return QuoteInput(
//    quoteConfig: .constant(dumbQuote),
//    isShowingStyling: .constant(false),
//    animation: heroAnimation
//  )
//}

