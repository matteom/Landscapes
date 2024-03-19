//
//  ContentView.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 19/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			TopLandscapesView()
				.navigationDestination(for: ArtObject.self) { landscape in
					PaintingView(artObject: landscape)
				}
		}
    }
}

#Preview {
    ContentView()
}
