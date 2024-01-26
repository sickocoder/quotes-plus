//
//  Binding+Extension.swift
//  Quotes+
//
//  Created by José Tony on 13/07/23.
//

import SwiftUI

public extension Binding where Value: Equatable {
  
  init(_ source: Binding<Value?>, replacingNilWith nilProxy: Value) {
    self.init(
      get: { source.wrappedValue ?? nilProxy },
      set: { newValue in
        if newValue == nilProxy {
          source.wrappedValue = nil
        } else {
          source.wrappedValue = newValue
        }
      }
    )
  }
}

public extension Binding where Value == String {
  func limit(to: Int) -> Self {
    if self.wrappedValue.count > to {
      DispatchQueue.main.async {
        self.wrappedValue = String(self.wrappedValue.dropLast())
      }
    }
    
    return self
  }
}
