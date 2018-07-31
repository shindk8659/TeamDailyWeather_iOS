

import Foundation
struct Temperature : Codable {
	let tc : String?
	let tmax : String?
	let tmin : String?

	enum CodingKeys: String, CodingKey {

		case tc = "tc"
		case tmax = "tmax"
		case tmin = "tmin"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		tc = try values.decodeIfPresent(String.self, forKey: .tc)
		tmax = try values.decodeIfPresent(String.self, forKey: .tmax)
		tmin = try values.decodeIfPresent(String.self, forKey: .tmin)
	}

}
