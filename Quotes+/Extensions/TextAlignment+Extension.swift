//
//  TextAlignment+Extension.swift
//  Quotes+
//
//  Created by José Tony on 18/07/23.
//

import SwiftUI

extension TextAlignment {
  static func from(alignment: Alignment) -> TextAlignment {
    switch alignment {
    case .leading:
      return TextAlignment.leading
    case .center:
      return TextAlignment.center
    case .trailing:
      return TextAlignment.trailing
    default:
      return TextAlignment.leading
    }
  }
}
