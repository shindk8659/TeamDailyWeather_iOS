

import Foundation
struct FeedData : Codable {
	let _id : String?
	let user_id : String?
	let gu : String?
	let air_volume : Int?
	let heat : Int?
	let cold : Int?
	let humidity : Int?
	let user_outer : Int?
	let user_top : Int?
	let user_bottom : Int?
	let __v : Int?
	let created_at : String?
    let update_at: String?
	let image : String?
	let content : String?
    

	enum CodingKeys: String, CodingKey {

		case _id = "_id"
		case user_id = "user_id"
		case gu = "gu"
		case air_volume = "air_volume"
		case heat = "heat"
		case cold = "cold"
		case humidity = "humidity"
		case user_outer = "user_outer"
		case user_top = "user_top"
		case user_bottom = "user_bottom"
		case __v = "__v"
		case created_at = "created_at"
        case update_at = "update_at"
		case image = "image"
		case content = "content"
	}

	init(from decoder: Decoder) throws {
        
		let values = try decoder.container(keyedBy: CodingKeys.self)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
		gu = try values.decodeIfPresent(String.self, forKey: .gu)
		air_volume = try values.decodeIfPresent(Int.self, forKey: .air_volume)
		heat = try values.decodeIfPresent(Int.self, forKey: .heat)
		cold = try values.decodeIfPresent(Int.self, forKey: .cold)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		user_outer = try values.decodeIfPresent(Int.self, forKey: .user_outer)
		user_top = try values.decodeIfPresent(Int.self, forKey: .user_top)
		user_bottom = try values.decodeIfPresent(Int.self, forKey: .user_bottom)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        update_at = try values.decodeIfPresent(String.self, forKey: .update_at)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		content = try values.decodeIfPresent(String.self, forKey: .content)
    }

}
