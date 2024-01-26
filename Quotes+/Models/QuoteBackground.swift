//
//  QuoteBackground.swift
//  Quotes+
//
//  Created by A255085 on 25/01/24.
//

import SwiftUI

protocol QuoteBackground {
	var id: String { get set }
	var anyHashableID: AnyHashable { get }
}

extension QuoteBackground {
	var anyHashableID: AnyHashable { AnyHashable(id) }
}

struct QuoteBasicBGColor: QuoteBackground {
	var id: String
	var color: Color
}

struct QuoteGradientBG: QuoteBackground {
	var id: String
	var gradient: LinearGradient
}

struct QuoteImageBG: QuoteBackground {
	var id: String
	var imageData: Data
}
