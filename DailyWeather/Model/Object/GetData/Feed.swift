

import Foundation
struct Feed : Codable {
	let success : Bool?
	let message : String?
	let errors : String?
	let data : [FeedData]?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case message = "message"
		case errors = "errors"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		errors = try values.decodeIfPresent(String.self, forKey: .errors)
		data = try values.decodeIfPresent([FeedData].self, forKey: .data)
	}

}
