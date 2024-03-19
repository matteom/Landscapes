//
//  PreviewData.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 20/03/24.
//

import Foundation

extension Bundle {
	func decode<T: Decodable>(resource: String, withExtension extension: String) -> T {
		let url = url(forResource: resource, withExtension: `extension`)!
		let data = try! Data(contentsOf: url)
		return try! JSONDecoder.rijksMuseumDecoder.decode(T.self, from: data)
	}
}

extension Result {
	static let preview: Self = Bundle.main.decode(resource: "Result",withExtension: "json")
}

extension Painting {
	static let preview: Self = Bundle.main.decode(resource: "Painting",withExtension: "json")
}

extension ArtObject {
	static let preview: Self = Result.preview.artObjects[0]
}
