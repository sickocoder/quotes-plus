//
//  Alignment+Extension.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

extension Alignment {
  static func from(text: String) -> Alignment {
    switch text {
    case "text.alignleft":
      return .leading
    case "text.aligncenter":
      return .center
    case "text.alignright":
      return .trailing
    default:
      return .leading
    }
  }
}
