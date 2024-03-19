//
//  AsyncProgressImage.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 27/03/24.
//

import SwiftUI

struct LoadingImage: View {
	let url: URL

    var body: some View {
		AsyncImage(url: url) { image in
			image
				.resizable()
				.aspectRatio(contentMode: .fit)
		} placeholder: {
			ProgressView()
				.frame(maxWidth: .infinity)
		}
    }
}
