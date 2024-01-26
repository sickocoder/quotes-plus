//
//  QTextField.swift
//  Quotes+
//
//  Created by A255085 on 25/01/24.
//

import SwiftUI

struct QTextField: View {
	@Binding var text: String
	@FocusState private var focused: Bool?
	
	var body: some View {
		TextField("write the quote", text: $text, axis: .vertical)
			.font(.title)
			.multilineTextAlignment(.center)
			.tint(.white)
			.foregroundStyle(.white)
			.padding()
			.padding(.horizontal, 50)
			.focused($focused, equals: true)
			.onAppear {
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
					self.focused = true
				}
			}
	}
}

#Preview {
	QTextField(text: .constant(""))
}

