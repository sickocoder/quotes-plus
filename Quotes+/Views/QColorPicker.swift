//
//  QColorPicker.swift
//  Quotes+
//
//  Created by A255085 on 26/01/24.
//

import SwiftUI

struct QColorPicker: View {
	@Binding var color: Color
	
	var body: some View {
		color
			.frame(width: 40, height: 40, alignment: .center)
			.cornerRadius(20.0)
			.overlay(Circle().stroke(Color.white, style: StrokeStyle(lineWidth: 3)))
			.padding(5)
			.background(AngularGradient(gradient: Gradient(colors: [.red,.yellow,.green,.blue,.purple,.pink]), center:.center).cornerRadius(40.0))
			.overlay(ColorPicker("", selection: $color).labelsHidden().opacity(0.015))
	}
}

#Preview {
	QColorPicker(color: .constant(.red))
}

