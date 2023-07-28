//
//  Image+Extension.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

extension Image {
  static func iconFrom(alignment: Alignment) -> String {
    switch alignment {
    case .leading:
      return "text.alignleft"
    case .center:
      return "text.aligncenter"
    case .trailing:
      return "text.alignright"
    default:
      return "text.alignleft"
    }
  }
}
