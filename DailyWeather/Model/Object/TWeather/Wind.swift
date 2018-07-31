

import Foundation
struct Wind : Codable {
	let wdir : String?
	let wspd : String?

	enum CodingKeys: String, CodingKey {

		case wdir = "wdir"
		case wspd = "wspd"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wdir = try values.decodeIfPresent(String.self, forKey: .wdir)
		wspd = try values.decodeIfPresent(String.self, forKey: .wspd)
	}

}
