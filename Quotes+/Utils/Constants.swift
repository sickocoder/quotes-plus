//
//  Constants.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI
import Collections

struct AnimationID {
  static let hero = "hero-animation"
}

var textAligmentToImage = [
  "text.alignleft",
  "text.aligncenter",
  "text.alignright"
]

var textStyleImage: OrderedDictionary<String, Font.Weight> = [
  "medium": .medium,
  "bold": .bold,
]

let availableTextSizes: OrderedDictionary<String, Float> = [
  "small": 20,
  "regular": 28,
  "large": 36,
  "extra-large": 48
]

let BASE_QUOTE = QuoteModel(
	quoteText: "",
	author: "NA",
	textAlign: "text.aligncenter",
	backgroundColorID: (availableQuoteColors[0] as! QuoteGradientBG).id,
	fontFamily: "default",
	fontSize: 20,
	fontWeight: "medium",
	isFavorite: false
)
