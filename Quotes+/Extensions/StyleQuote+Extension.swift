//
//  StyleQuote+Extension.swift
//  Quotes+
//
//  Created by A255085 on 25/01/24.
//

import SwiftUI

extension StyleQuote {
	func getCardView() -> some View {
		QuoteCard(
			quoteConfig: quoteConfig,
			showQuotes: true,
			isInExportMode: true
		)
		.frame(width: UIScreen.main.bounds.width)
	}
	
	@MainActor
	func render() -> UIImage? {
		
		let renderer = ImageRenderer(content: getCardView())
		renderer.scale = displayScale
		return renderer.uiImage
	}
}
