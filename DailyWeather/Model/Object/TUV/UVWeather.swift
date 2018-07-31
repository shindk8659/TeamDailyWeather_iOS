

import Foundation
struct UVWeather : Codable {
	let wIndex : WIndex?

	enum CodingKeys: String, CodingKey {

		case wIndex = "wIndex"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wIndex = try values.decodeIfPresent(WIndex.self, forKey: .wIndex)
	}

}
