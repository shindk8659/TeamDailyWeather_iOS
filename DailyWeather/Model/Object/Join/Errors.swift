

import Foundation
struct Errors : Codable {
	let username : Username?
    let password: Password?
    let id : Id?

	enum CodingKeys: String, CodingKey {

		case username = "username"
        case password = "password"
        case id = "id"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		username = try values.decodeIfPresent(Username.self, forKey: .username)
        password = try values.decodeIfPresent(Password.self, forKey: .password)
        id = try values.decodeIfPresent(Id.self, forKey: .id)

        
	}

}
