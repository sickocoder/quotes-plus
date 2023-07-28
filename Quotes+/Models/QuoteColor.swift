//
//  QuoteColor.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QuoteColor: Identifiable {
  var id: String
  var color: Color
  var isGradient: Bool
  var gradient: LinearGradient
  
  init(
    id: String,
    color: Color = .purple,
    isGradient: Bool = false,
    gradient: LinearGradient = LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
  ) {
    self.id = id
    self.color = color
    self.isGradient = isGradient
    self.gradient = gradient
  }
}

let availableQuoteColors = [
  QuoteColor(
    id: "red-to-purple",
    isGradient: true,
    gradient: LinearGradient(
      colors: [Color.red, Color.purple],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
  QuoteColor(
    id: "cyan-to-pink",
    isGradient: true,
    gradient: LinearGradient(
      colors: [Color.cyan, Color.pink],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
  QuoteColor(
    id: "pink-to-indigo",
    isGradient: true,
    gradient: LinearGradient(
      colors: [Color.pink, Color.indigo],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
  QuoteColor(
    id: "yellow-to-orange",
    isGradient: true,
    gradient: LinearGradient(
      colors: [Color.yellow, Color.orange],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    )
  ),
  QuoteColor(id: "still-blue", color: .blue),
  QuoteColor(id: "still-teal", color: .teal),
  QuoteColor(id: "still-mint", color: .mint)
]
