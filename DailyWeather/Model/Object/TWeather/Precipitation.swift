

import Foundation
struct Precipitation : Codable {
	let sinceOntime : String?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case sinceOntime = "sinceOntime"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sinceOntime = try values.decodeIfPresent(String.self, forKey: .sinceOntime)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
