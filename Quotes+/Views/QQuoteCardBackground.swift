//
//  QQuoteCardBackground.swift
//  Quotes+
//
//  Created by A255085 on 26/01/24.
//

import SwiftUI
import UIKit

extension Image {
	init(data: Data) {
		let image = UIImage(data: data) ?? UIImage()
		self.init(uiImage: image)
	}
}

struct QQuoteCardBackground: View {
	var background: QuoteBackground
	var backgroundImage: QuoteImageBG? = nil
	var width: Double
	var fullHeight: Bool = false
	
	private let screenDimensions = UIScreen.main.bounds.size
	
	var body: some View {
		if background is QuoteGradientBG {
			(background as! QuoteGradientBG).gradient
				.ignoresSafeArea(.all)
		}
		
		if background is QuoteBasicBGColor {
			(background as! QuoteBasicBGColor).color
				.ignoresSafeArea(.all)
		}
		
		if let backgroundImage = backgroundImage {
			GeometryReader { proxy in
				ZStack {
					Image(data: backgroundImage.imageData)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(maxWidth: proxy.size.width, maxHeight: fullHeight ? screenDimensions.height : proxy.size.height)
						.ignoresSafeArea(.all)
					
					
					Color.black.opacity(0.4)
						.frame(maxWidth: proxy.size.width, maxHeight: fullHeight ? screenDimensions.height : proxy.size.height)
						.ignoresSafeArea(.all)
				}
			}
			
		}
	}
}

#Preview {
	QQuoteCardBackground(background: availableQuoteColors[0], width: 300)
}


