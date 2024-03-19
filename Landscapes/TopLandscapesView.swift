//
//  LandscapesView.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 20/03/24.
//

import SwiftUI

struct TopLandscapesView: View {
	@State private var landscapes: [ArtObject] = []

    var body: some View {
		ScrollView {
			LazyVStack(spacing: 16.0) {
				ForEach(landscapes) { landscape in
					NavigationLink(value: landscape) {
						LandscapeCard(artObject: landscape)
					}
					.buttonStyle(.plain)
				}
			}
		}
		.contentMargins(20.0, for: .scrollContent)
		.navigationTitle("Landscapes")
		.task { try? await fetchLandscapes() }
    }

	func fetchLandscapes() async throws {
		let url = URL(
			string: "https://www.rijksmuseum.nl/api/en/collection?key=[your-key]&q=landscape&toppieces=true&type=painting"
		)!
		let (data, _)  = try await URLSession.shared.data(from: url)
		let result = try JSONDecoder.rijksMuseumDecoder.decode(Result.self, from: data)
		landscapes = result.artObjects
	}
}

#Preview {
	NavigationStack {
		TopLandscapesView()
	}
}
