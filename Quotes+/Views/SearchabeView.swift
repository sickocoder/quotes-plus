//
//  SearchabeView.swift
//  Quotes+
//
//  Created by José Tony on 28/07/23.
//

import SwiftUI

struct SearchabeView<DataType, Content: View>: View {
  var searchText: String
  var data: [DataType]
  
  var predicate: Predicate<DataType>
  
  var content: (_ data: [DataType]) -> Content
  
  private var filteredData: [DataType] {
    do {
      return try data.filter(predicate)
    } catch {
      return []
    }
  }
  
    var body: some View {
			if filteredData.isEmpty {
				VStack {
					if searchText.isEmpty {
						Text("No quotes to show.")
					} else {
						Text("No quotes found.")
					}
				}
			} else {
				content(filteredData)
			}
    }
}

#Preview {
  SearchabeView(
    searchText: "",
    data: [],
    predicate: #Predicate { quote in
      true
    }) { data in
    Text("fsdf")
  }
}
