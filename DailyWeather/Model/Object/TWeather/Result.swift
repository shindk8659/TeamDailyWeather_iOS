
import Foundation
struct Result : Codable {
	let code : Int?
	let requestUrl : String?
	let message : String?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case requestUrl = "requestUrl"
		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		requestUrl = try values.decodeIfPresent(String.self, forKey: .requestUrl)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
