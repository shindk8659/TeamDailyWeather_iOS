

import Foundation
struct Pressure : Codable {
	let surface : String?
	let seaLevel : String?

	enum CodingKeys: String, CodingKey {

		case surface = "surface"
		case seaLevel = "seaLevel"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		surface = try values.decodeIfPresent(String.self, forKey: .surface)
		seaLevel = try values.decodeIfPresent(String.self, forKey: .seaLevel)
	}

}
