//
//  DetailsView.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 20/03/24.
//

import SwiftUI

struct PaintingView: View {
	let artObject: ArtObject
	@State private var details: Painting?

    var body: some View {
		ScrollView {
			if let details {
				VStack(alignment: .leading) {
					LoadingImage(url: details.imageURL)
					VStack(alignment: .leading, spacing: 16.0) {
						Text(details.title)
							.font(.title)
							.bold()
						ForEach(details.makers) { maker in
							MakerLabel(maker: maker)
						}
						ColorGrid(colors: details.colors)
						Text(details.description)
					}
					.safeAreaPadding()
				}
			}
		}
		.navigationTitle("Landscape Details")
		.task { try! await fetchDetails() }
    }

	func fetchDetails() async throws {
		let url = URL(string: "https://www.rijksmuseum.nl/api/en/collection/\(artObject.id)?key=[your-key]")!
		let (data, _)  = try await URLSession.shared.data(from: url)
		details = try JSONDecoder.rijksMuseumDecoder.decode(Painting.self, from: data)
	}
}

#Preview {
	NavigationStack {
		PaintingView(artObject: Result.preview.artObjects[0])
	}
}
