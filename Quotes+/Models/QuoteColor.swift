//
//  QuoteColor.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

//struct QuoteColor: Identifiable {
//  var id: String
//  var color: Color
//  var isGradient: Bool
//  var gradient: LinearGradient
//  
//  init(
//    id: String,
//    color: Color = .purple,
//    isGradient: Bool = false,
//    gradient: LinearGradient = LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
//  ) {
//    self.id = id
//    self.color = color
//    self.isGradient = isGradient
//    self.gradient = gradient
//  }
//}

let availableQuoteColors: [any QuoteBackground] = [
  QuoteGradientBG(
    id: "red-to-purple",
    gradient: LinearGradient(
      colors: [Color.red, Color.purple],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
	QuoteGradientBG(
    id: "cyan-to-pink",
    gradient: LinearGradient(
      colors: [Color.cyan, Color.pink],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
	QuoteGradientBG(
    id: "pink-to-indigo",
    gradient: LinearGradient(
      colors: [Color.pink, Color.indigo],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
	QuoteGradientBG(
    id: "yellow-to-orange",
    gradient: LinearGradient(
      colors: [Color.yellow, Color.orange],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
  QuoteBasicBGColor(id: "still-blue", color: .blue),
	QuoteBasicBGColor(id: "still-teal", color: .teal),
	QuoteBasicBGColor(id: "still-mint", color: .mint)
]
