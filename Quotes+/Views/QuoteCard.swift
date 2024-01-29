//
//  QuoteCard.swift
//  Quotes+
//
//  Created by José Tony on 22/07/23.
//

import SwiftUI

struct QuoteCard: View {
	var quoteConfig: QuoteModel
	var showQuotes: Bool = false
	var isInExportMode: Bool = false
	
	var hiddenBorders: Bool = false
	
	private var quoteText: String {
		let limit: Int = 250
		
		if isInExportMode || quoteConfig.quoteText.count <= limit {
			return quoteConfig.quoteText
		}
		
		return "\(quoteConfig.quoteText.prefix(limit))..."
	}
	
	private var quoteColor: QuoteBackground {
		quoteConfig.getBackgroundColor()
	}
	
	var body: some View {
		ZStack {
			QQuoteCardBackground(
				background: quoteColor,
				backgroundImage: quoteConfig.backgroundImage,
				width: UIScreen.main.bounds.width - 32
			).clipShape(RoundedRectangle(cornerRadius: hiddenBorders ? 0 : 12))
			
			VStack(alignment: .leading) {
				if showQuotes {
					Image(systemName: "quote.opening")
						.font(.system(size: 35))
						.fontWeight(.bold)
				}
				
				Text(quoteText)
					.multilineTextAlignment(TextAlignment.from(alignment: Alignment.from(text: quoteConfig.textAlign)))
					.font(quoteConfig.fontFamily.lowercased() == "default" ?
						.system(size: CGFloat(quoteConfig.fontSize)) :
						.custom(quoteConfig.fontFamily, size: CGFloat(quoteConfig.fontSize))
					)
					.fontWeight(textStyleImage[quoteConfig.fontWeight] ?? .medium)
					.italic(quoteConfig.fontWeight == "italic")
					.frame(maxWidth: .infinity, alignment: Alignment.from(text: quoteConfig.textAlign))
					.padding(.vertical, showQuotes ? (isInExportMode ? 40 : 30) : 0)
				
				if showQuotes {
					HStack {
						Spacer()
						Image(systemName: "quote.closing")
							.font(.system(size: 35))
							.fontWeight(.bold)
					}
				}
			}
			.foregroundStyle(.white)
			.padding(40)
			
			
			if quoteConfig.isFavorite {
				VStack {
					HStack {
						Spacer()
						
						Image(systemName: "star.fill")
							.font(.title2)
							.bold()
							.foregroundStyle(.white)
							.opacity(0.4)
					}
					Spacer()
				}
				.padding()
			}
		}
//		.background(QQuoteCardBackground(
//			background: quoteColor,
//			backgroundImage: quoteConfig.backgroundImage,
//			width: UIScreen.main.bounds.width - 32
//		).clipShape(RoundedRectangle(cornerRadius: hiddenBorders ? 0 : 12)))
		.fixedSize(horizontal: false, vertical: true)
	}
}

#Preview {
	QuoteCard(quoteConfig: dumbQuote)
}


