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
			isInExportMode: true,
			hiddenBorders: true
		)
		.frame(width: UIScreen.main.bounds.width - 32)
	}
	
	@MainActor
	func render() -> UIImage? {
		
		let renderer = ImageRenderer(content: getCardView())
		renderer.scale = displayScale
		return renderer.uiImage
	}
}

/// yeah I know! not cool but works for now
extension QuoteListView {
	func getCardView(_ data: QuoteModel) -> some View {
		QuoteCard(
			quoteConfig: data,
			showQuotes: true,
			isInExportMode: true,
			hiddenBorders: true
		)
		.frame(width: UIScreen.main.bounds.width - 32)
	}
	
	@MainActor
	func render(data: QuoteModel) -> UIImage? {
		
		let renderer = ImageRenderer(content: getCardView(data))
		renderer.scale = displayScale
		return renderer.uiImage
	}
}
