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
  var gradient: LinearGradient?
  var color: Color?
  
  func body(content: Content) -> some View {
    if shouldApply {
			if let gradient = gradient {
				content.tint(gradient)
			}
			
			if let color = color {
				content.tint(color)
			}
    } else {
      content
    }
  }
}

struct BackgroundModifier: ViewModifier {
  var shouldApply: Bool
  var gradient: LinearGradient?
  var color: Color?
  
  func body(content: Content) -> some View {
    if shouldApply {
			if let gradient = gradient {
				content.background(gradient)
			}
			
			if let color = color {
				content.background(color)
			}
    } else {
      content.background(Color.black.opacity(0.2))
    }
  }
}

extension View {
	func setTint(shouldApply: Bool = true, gradient: LinearGradient?, color: Color?, isImage: Bool = false) -> some View {
		if isImage {
			return modifier(TintModifier(shouldApply: shouldApply, gradient: nil, color: .accentColor))
		}
    
    return modifier(TintModifier(
      shouldApply: shouldApply,
      gradient: gradient,
      color: color
    ))
  }
  
  func setBackground(shouldApply: Bool = true, gradient: LinearGradient?, color: Color?, isImage: Bool = false) -> some View {
		if isImage {
			return modifier(BackgroundModifier(shouldApply: shouldApply, gradient: nil, color: .accentColor))
		}
		
    return modifier(BackgroundModifier(
      shouldApply: shouldApply,
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


