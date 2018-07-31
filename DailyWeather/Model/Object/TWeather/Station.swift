

import Foundation
struct Station : Codable {
	let latitude : String?
	let longitude : String?
	let name : String?
	let id : String?
	let type : String?

	enum CodingKeys: String, CodingKey {

		case latitude = "latitude"
		case longitude = "longitude"
		case name = "name"
		case id = "id"
		case type = "type"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		type = try values.decodeIfPresent(String.self, forKey: .type)
	}

}
