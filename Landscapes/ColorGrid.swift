//
//  ColorGrid.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 27/03/24.
//

import SwiftUI

struct ColorGrid: View {
	let colors: [String]
	
    var body: some View {
		HStack {
			ForEach(colors, id: \.self) { color in
				Color(hex: color)
					.frame(height: 36.0)
			}
		}
    }
}

extension Color {
	init(hex: String) {
		let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
		var int: UInt64 = 0
		Scanner(string: hex).scanHexInt64(&int)
		self.init(
			.sRGB,
			red: Double(int >> 16) / 255,
			green: Double(int >> 8 & 0xFF) / 255,
			blue:  Double(int & 0xFF) / 255,
			opacity: 1.0
		)
	}
}

#Preview {
	ColorGrid(colors: Painting.preview.colors)
		.padding()
}
