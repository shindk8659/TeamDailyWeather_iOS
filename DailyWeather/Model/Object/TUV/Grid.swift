
import Foundation
struct Grid : Codable {
	let city : String?
	let county : String?
	let village : String?

	enum CodingKeys: String, CodingKey {

		case city = "city"
		case county = "county"
		case village = "village"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		city = try values.decodeIfPresent(String.self, forKey: .city)
		county = try values.decodeIfPresent(String.self, forKey: .county)
		village = try values.decodeIfPresent(String.self, forKey: .village)
	}

}
