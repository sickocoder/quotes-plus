//
//  QImagePicker.swift
//  Quotes+
//
//  Created by A255085 on 26/01/24.
//

import SwiftUI
import PhotosUI

struct QImagePicker: View {
	@State private var isShowPicker: Bool = false
	@Binding var image: Image?
	
	var body: some View {
		Button {
			withAnimation {
				self.isShowPicker.toggle()
			}
		} label: {
			Image(systemName: "photo.circle.fill")
				.resizable()
				.tint(Color.accentColor)
				.frame(width: 48, height: 48)
				.clipShape(Circle())
				.opacity(0.8)
		}
		.sheet(isPresented: $isShowPicker) {
			ImagePicker(image: self.$image)
				.ignoresSafeArea(.all)
		}

		
//		PhotosPicker(selection: $currentPhoto, matching: .images, photoLibrary: .shared()) {
//			Image(systemName: "photo.circle.fill")
//				.resizable()
//				.tint(Color.accentColor)
//				.frame(width: 48, height: 48)
//				.clipShape(Circle())
//				.opacity(0.8)
//		}
//		.onChange(of: currentPhoto) {
//			if let currentPhoto = currentPhoto,
//				 let localId = currentPhoto.itemIdentifier
//			{
//				let result = PHAsset.fetchAssets(withLocalIdentifiers: [localId], options: nil)
//				
//				if let asset = result.firstObject {
//					asset.requestContentEditingInput(with: PHContentEditingInputRequestOptions()) { (input, _) in
//						if let input = input,
//							 let url = input.fullSizeImageURL
//						{
//							selectedImageURL = url.absoluteString
//							print("Got: 2 - \(url.absoluteString)")
//						}
//					}
//				} else {
//					print("Got: error")
//				}
//				
//			} else {
//				print("Got: error")
//			}
//		}
	}
}

struct ImagePicker: UIViewControllerRepresentable {
	
	@Environment(\.presentationMode)
	var presentationMode
	
	@Binding var image: Image?
	
	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		
		@Binding var presentationMode: PresentationMode
		@Binding var image: Image?
		
		init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
			_presentationMode = presentationMode
			_image = image
		}
		
		func imagePickerController(_ picker: UIImagePickerController,
															 didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
			image = Image(uiImage: uiImage)
			presentationMode.dismiss()
			
		}
		
		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			presentationMode.dismiss()
		}
		
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(presentationMode: presentationMode, image: $image)
	}
	
	func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		return picker
	}
	
	func updateUIViewController(_ uiViewController: UIImagePickerController,
															context: UIViewControllerRepresentableContext<ImagePicker>) {
		
	}
	
}

#Preview {
	QImagePicker(image: .constant(Image("placeholder")))
}



