//
//  QuoteInputScreen.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

struct QuoteInput: View {
	@Binding var quoteConfig: QuoteModel
	var selectedColor: any QuoteBackground {
		quoteConfig.getBackgroundColor()
	}
	
	@Binding var isShowingStyling: Bool
	let animation: Namespace.ID
	
	@FocusState private var focused: Bool?
	
	var body: some View {
		ZStack {
			Group {
				if selectedColor is QuoteGradientBG {
					(selectedColor as! QuoteGradientBG).gradient
				} else {
					(selectedColor as! QuoteBasicBGColor).color
				}
			}.ignoresSafeArea(.all)
			
			VStack {
				Spacer()
				QTextField(text: $quoteConfig.quoteText)
				
				Spacer()
				QBackgroundPicker(selectedColorID: $quoteConfig.backgroundColorID)
				
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
		}
		.matchedGeometryEffect(id: AnimationID.hero, in: animation, anchor: .top)
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

