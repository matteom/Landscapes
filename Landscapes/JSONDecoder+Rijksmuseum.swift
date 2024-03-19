//
//  JSONDecoder+Rijksmuseum.swift
//  Landscapes
//
//  Created by Matteo Manferdini on 27/03/24.
//

import Foundation

extension JSONDecoder {
	static let rijksMuseumDecoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .custom { decoder in
			let container = try decoder.singleValueContainer()
			let dateString = try container.decode(String.self)
			let formatter = DateFormatter()
			formatter.dateFormat = "yyyy-MM-dd"
			if let date = formatter.date(from: dateString) {
				return date
			}
			formatter.dateFormat = "yyyy"
			return formatter.date(from: dateString)!
		}
		return decoder
	}()
}
