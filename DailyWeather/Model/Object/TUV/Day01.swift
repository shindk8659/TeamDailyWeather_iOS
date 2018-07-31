

import Foundation
struct Day01 : Codable {
	let imageUrl : String?
	let index : String?
	let comment : String?

	enum CodingKeys: String, CodingKey {

		case imageUrl = "imageUrl"
		case index = "index"
		case comment = "comment"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
		index = try values.decodeIfPresent(String.self, forKey: .index)
		comment = try values.decodeIfPresent(String.self, forKey: .comment)
	}

}
