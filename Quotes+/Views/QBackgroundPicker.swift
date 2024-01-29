//
//  QColorPicker.swift
//  Quotes+
//
//  Created by José Tony on 14/07/23.
//

import SwiftUI

extension Image {
	@MainActor func getUIImage(scale displayScale: CGFloat = 1.0) -> UIImage? {
		let renderer = ImageRenderer(content: self)
		
		renderer.scale = displayScale
		
		return renderer.uiImage
	}
}

struct QBackgroundPicker: View {
	@Binding var selectedColorID: String
	
	var onImageSelected: (_ imageData: Data?) -> ()
	
	@State private var selectedColor: Color = .red
	@State private var selectedImage: Image? = nil
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(availableQuoteColors, id: \.anyHashableID) { colorConfig in
					QColorPill(selectedColorQuoteID: selectedColorID, colorConfig: colorConfig) { color in
						onImageSelected(nil)
						withAnimation {
							selectedColorID = color.id
						}
					}
				}
				
				QColorPicker(color: $selectedColor)
					.onChange(of: selectedColor) {
						if let colorId = selectedColor.toHex() {
							onImageSelected(nil)
							withAnimation {
								selectedColorID = colorId
							}
						}
					}
				
					QImagePicker(image: $selectedImage)
						.onChange(of: selectedImage) {
							if let selectedImage = selectedImage,
								 let uiImage = selectedImage.getUIImage(),
								 let imageData = uiImage.pngData()
							{
								onImageSelected(imageData)
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
	QBackgroundPicker(
		selectedColorID: .constant((availableQuoteColors[0] as! QuoteGradientBG).id)
	) { image in }
}



