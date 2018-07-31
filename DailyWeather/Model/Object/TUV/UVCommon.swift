

import Foundation
struct UVCommon : Codable {
	let alertYn : String?
	let stormYn : String?

	enum CodingKeys: String, CodingKey {

		case alertYn = "alertYn"
		case stormYn = "stormYn"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		alertYn = try values.decodeIfPresent(String.self, forKey: .alertYn)
		stormYn = try values.decodeIfPresent(String.self, forKey: .stormYn)
	}

}
