//
//  MakerLabel.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 27/03/24.
//

import SwiftUI

struct MakerLabel: View {
	let maker: Maker

    var body: some View {
		Label(
			title: {
				VStack(alignment: .leading) {
					Text(maker.name)
					Text(optional: maker.placeOfBirth) 
					+ Text(" - ")
					+ Text(optional: maker.dateOfBirth?.formatted(.dateTime.year()))
					Text(optional: maker.placeOfDeath) 
					+ Text(" - ")
					+ Text(optional: maker.dateOfDeath?.formatted(.dateTime.year()))
				}
			},
			icon: {
				Image(systemName: "paintpalette")
			}
		)
		.foregroundStyle(.secondary)
    }
}

extension Text {
	init(optional: String?) {
		self.init(optional ?? "")
	}
}

#Preview {
	MakerLabel(maker: Painting.preview.makers[0])
}
