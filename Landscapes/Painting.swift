//
//  ArtObjectDetails.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 19/03/24.
//

import Foundation

struct Painting: Decodable {
	let id: String
	let title: String
	let description: String
	let imageURL: URL
	let makers: [Maker]
	let colors: [String]

	enum CodingKeys: CodingKey {
		case artObject
	}

	enum ArtObjectKeys: String, CodingKey {
		case id = "objectNumber"
		case title
		case description = "plaqueDescriptionEnglish"
		case imageURL = "webImage"
		case makers = "principalMakers"
		case colors = "normalizedColors"
	}

	enum ColorKeys: CodingKey {
		case hex
	}

	enum ImageKeys: CodingKey {
		case url
	}

	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let artObjectContaner = try container.nestedContainer(
			keyedBy: ArtObjectKeys.self,
			forKey: .artObject
		)
		id = try artObjectContaner.decode(String.self, forKey: .id)
		title = try artObjectContaner.decode(String.self, forKey: .title)
		description = try artObjectContaner.decode(String.self, forKey: .description)
		makers = try artObjectContaner.decode([Maker].self, forKey: .makers)
		let imageContainer = try artObjectContaner.nestedContainer(
			keyedBy: ImageKeys.self,
			forKey: .imageURL
		)
		imageURL = try imageContainer.decode(URL.self, forKey: .url)
		var colorsContainer = try artObjectContaner.nestedUnkeyedContainer(forKey: .colors)
		var colors: [String] = []
		while !colorsContainer.isAtEnd {
			let colorContainer = try colorsContainer.nestedContainer(keyedBy: ColorKeys.self)
			let color = try colorContainer.decode(String.self, forKey: .hex)
			colors.append(color)
		}
		self.colors = colors
	}
}

struct Maker: Decodable, Identifiable {
	let name: String
	let placeOfBirth: String?
	let placeOfDeath: String?
	let dateOfBirth: Date?
	let dateOfDeath: Date?

	var id: String { name }
}
