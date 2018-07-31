

import Foundation
struct Weather : Codable {
	let minutely : [Minutely]?

	enum CodingKeys: String, CodingKey {

		case minutely = "minutely"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		minutely = try values.decodeIfPresent([Minutely].self, forKey: .minutely)
	}

}
