//
//  ArtObject.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 19/03/24.
//

import Foundation

struct Result: Decodable {
	let artObjects: [ArtObject]
}

struct ArtObject: Decodable, Identifiable, Hashable {
	let id: String
	let title: String
	let author: String
	let imageURL: URL

	enum CodingKeys: String, CodingKey {
		case id = "objectNumber"
		case title
		case author = "principalOrFirstMaker"
		case image = "headerImage"
	}

	enum ImageCodingKeys: CodingKey {
		case url
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(String.self, forKey: .id)
		title = try container.decode(String.self, forKey: .title)
		author = try container.decode(String.self, forKey: .author)
		let imageContainer = try container.nestedContainer(
			keyedBy: ImageCodingKeys.self,
			forKey: .image
		)
		imageURL = try imageContainer.decode(URL.self, forKey: .url)
	}
}
