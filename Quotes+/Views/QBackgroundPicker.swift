//
//  QColorPicker.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

struct QBackgroundPicker: View {
	@Binding var selectedColorID: String
	@State private var selectedColor: Color = .red
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(availableQuoteColors, id: \.anyHashableID) { colorConfig in
					QColorPill(selectedColorQuoteID: selectedColorID, colorConfig: colorConfig) { color in
						withAnimation {
							selectedColorID = color.id
						}
					}
				}
				
				QColorPicker(color: $selectedColor)
					.onChange(of: selectedColor) {
						if let colorId = selectedColor.toHex() {
							selectedColorID = colorId
						}
					}
			}
			.padding(.horizontal)
			.padding(.vertical, 2)
			.padding(.top)
		}
	}
}

#Preview {
	QBackgroundPicker(selectedColorID: .constant(availableQuoteColors[0].id))
}



