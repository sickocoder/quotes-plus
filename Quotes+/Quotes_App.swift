//
//  Quotes_App.swift
//  Quotes+
//
//  Created by José Tony on 07/07/23.
//

import SwiftUI
import SwiftData

@main
struct Quotes_App: App {
  var body: some Scene {
    WindowGroup {
      RootScreen()
    }
    .modelContainer(for: QuoteModel.self)
  }
}

