

import Foundation
struct WIndex : Codable {
	let uvindex : [Uvindex]?
	let timeRelease : String?

	enum CodingKeys: String, CodingKey {

		case uvindex = "uvindex"
		case timeRelease = "timeRelease"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uvindex = try values.decodeIfPresent([Uvindex].self, forKey: .uvindex)
		timeRelease = try values.decodeIfPresent(String.self, forKey: .timeRelease)
	}

}
