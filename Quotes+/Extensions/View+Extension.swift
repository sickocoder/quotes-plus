//
//  View+Extension.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI
import UIKit

struct TintModifier: ViewModifier {
  var shouldApply: Bool
  var isGradient: Bool
  var gradient: LinearGradient
  var color: Color
  
  func body(content: Content) -> some View {
    if shouldApply {
      if (isGradient) {
        content.tint(gradient)
      } else {
        content.tint(color)
      }
    } else {
      content
    }
  }
}

struct BackgroundModifier: ViewModifier {
  var shouldApply: Bool
  var isGradient: Bool
  var gradient: LinearGradient
  var color: Color
  
  func body(content: Content) -> some View {
    if shouldApply {
      if (isGradient) {
        content.background(gradient)
      } else {
        content.background(color)
      }
    } else {
      content.background(Color.black.opacity(0.2))
    }
  }
}

extension View {
  func setTint(shouldApply: Bool = true, isGradient: Bool, gradient: LinearGradient, color: Color) -> some View {
    
    modifier(TintModifier(
      shouldApply: shouldApply,
      isGradient: isGradient,
      gradient: gradient,
      color: color
    ))
  }
  
  func setBackground(shouldApply: Bool = true, isGradient: Bool, gradient: LinearGradient, color: Color) -> some View {
    
    modifier(BackgroundModifier(
      shouldApply: shouldApply,
      isGradient: isGradient,
      gradient: gradient,
      color: color
    ))
  }
  
  func dismissKeyboard() {
    let keyWindow = UIApplication.shared.connectedScenes
      .map { $0 as? UIWindowScene }
      .compactMap { $0 }
      .first?.windows.first
      
    keyWindow?.endEditing(true)
  }
}


