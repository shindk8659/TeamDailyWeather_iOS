

import Foundation
struct Join : Codable {
	let success : Bool?
	let errors : Errors?
	let data : JoinData?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case errors = "errors"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		errors = try values.decodeIfPresent(Errors.self, forKey: .errors)
		data = try values.decodeIfPresent(JoinData.self, forKey: .data)
	}

}
