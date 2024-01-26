//
//  LabelledDivider.swift
//  Quotes+
//
//  Created by José Tony on 07/07/23.
//

import SwiftUI

struct LabelledDivider: View {
	var label: String
	var horizontalPadding: CGFloat = 0
	var color: Color = .gray
	
	var body: some View {
		HStack {
			line
				.frame(width: 20)
			
			Text(label).foregroundColor(color)
				.padding(.horizontal, horizontalPadding)
			
			line
		}
	}
	
	var line: some View {
		VStack { Divider().background(color) }
	}
}

#Preview {
	LabelledDivider(label: "ola dsfsdf asdasda")
}

