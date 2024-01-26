//
//  QFonstPicker.swift
//  Quotes+
//
//  Created by José Tony on 19/07/23.
//

import SwiftUI

struct QFonstPicker: View {
  var selectedColorConfig: QuoteBackground
  var selectedFont: String
  var onPress: (_ font: String) -> ()
  
  var groupedItems: [[String]] = [[String]]()
  let screenWidth = UIScreen.main.bounds.width
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        ForEach(createGroupedItems(CustomFontManager.fontsArray), id: \.self) { subItems in
          HStack {
            ForEach(subItems, id: \.self) { word in
              Button(action: {
                onPress(word)
              }, label: {
                Text(word)
                  .fixedSize()
                  .padding(.vertical, 8)
                  .padding(.horizontal, 12)
                  .setBackground(
                    shouldApply: selectedFont.lowercased() == word.lowercased(),
                    gradient: (selectedColorConfig as? QuoteGradientBG)?.gradient,
                    color: (selectedColorConfig as? QuoteBasicBGColor)?.color
                  )
                  .foregroundColor(.white)
                  .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
              })
            }
          }
          .frame(maxWidth: .infinity, alignment: .leading)
        }
        
        Spacer()
      }
    }
  }
  
  
  private func createGroupedItems(_ items: [String]) -> [[String]] {
    
    var groupedItems: [[String]] = [[String]]()
    var tempItems: [String] =  [String]()
    var width: CGFloat = 0
    
    for word in items {
      
      let label = UILabel()
      label.text = word
      label.sizeToFit()
      
      let labelWidth = label.frame.size.width + 32
      
      if (width + labelWidth + 20) < screenWidth {
        width += labelWidth
        tempItems.append(word)
      } else {
        width = labelWidth
        groupedItems.append(tempItems)
        tempItems.removeAll()
        tempItems.append(word)
      }
      
    }
    
    groupedItems.append(tempItems)
    return groupedItems
    
  }
}

#Preview {
  QFonstPicker(selectedColorConfig: availableQuoteColors[0], selectedFont: "default") {font in}
}

