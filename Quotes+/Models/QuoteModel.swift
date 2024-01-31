//
//  QuoteModel.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import Foundation
import SwiftData
import SwiftUI


@Model
final class QuoteModel {
  @Attribute(.unique) let id: String
  var quoteText: String
  var author: String
  var textAlign: String
  var backgroundColorID: String
	var backgroundImage: QuoteImageBG?
  var fontFamily: String
  var fontSize: Float
  var fontWeight: String
  var isFavorite: Bool
  
  init(
		quoteText: String,
		author: String,
		textAlign: String,
		backgroundColorID: String,
		fontFamily: String,
		fontSize: Float,
		fontWeight: String,
		isFavorite: Bool
	) {
    self.id = UUID().uuidString
    self.quoteText = quoteText
    self.author = author
    self.textAlign = textAlign
    self.backgroundColorID = backgroundColorID
		self.backgroundImage = nil
    self.fontFamily = fontFamily
    self.fontSize = fontSize
    self.fontWeight = fontWeight
    self.isFavorite = isFavorite
  }
  
  func getBackgroundColor() -> QuoteBackground {
		let bg = availableQuoteColors.first { quoteBackground in
      return quoteBackground.id == self.backgroundColorID
    }
    
    guard let background = bg else {
			if let customBgColor = Color(hex: backgroundColorID) {
				return QuoteBasicBGColor(id: UUID().uuidString, color: customBgColor)
			}
			
			return availableQuoteColors[2]
    }
    
    return background
  }
	
	func getBackgroundImage() -> QuoteImageBG {
		guard let bgImage = self.backgroundImage else {
			return QuoteImageBG(imageData: Data())
		}
		
		return QuoteImageBG(imageData: bgImage.imageData)
	}
}

let dumbQuote = QuoteModel(quoteText: "test quote", author: "no author", textAlign: "text.aligncenter", backgroundColorID: (availableQuoteColors[0] as! QuoteGradientBG).id, fontFamily: "Merienda", fontSize: 20, fontWeight: "medium", isFavorite: false)
