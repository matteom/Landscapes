//
//  LandscapeRow.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 27/03/24.
//

import SwiftUI

struct LandscapeCard: View {
	let artObject: ArtObject

	var body: some View {
		VStack(alignment: .leading) {
			LoadingImage(url: artObject.imageURL)
			Group {
				Text(artObject.title)
					.font(.headline)
					.padding(.top, 8.0)
				Text(artObject.author)
					.foregroundStyle(.secondary)
					.padding(.bottom, 16.0)
			}
			.padding(.horizontal)
		}
		.background(Color.gray.quinary)
		.clipShape(RoundedRectangle(cornerRadius: 16.0))
	}
}

#Preview {
	LandscapeCard(artObject: .preview)
		.padding()
}
