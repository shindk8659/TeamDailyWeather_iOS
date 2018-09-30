/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PostData : Codable {
	let __v : Int?
	let user_id : String?
	let gu : String?
	let air_volume : Int?
	let heat : Int?
	let cold : Int?
	let humidity : Int?
	let user_outer : Int?
	let user_top : Int?
	let user_bottom : Int?
	let _id : String?
	let created_at : String?
	let image : String?
	let content : String?

	enum CodingKeys: String, CodingKey {

		case __v = "__v"
		case user_id = "user_id"
		case gu = "gu"
		case air_volume = "air_volume"
		case heat = "heat"
		case cold = "cold"
		case humidity = "humidity"
		case user_outer = "user_outer"
		case user_top = "user_top"
		case user_bottom = "user_bottom"
		case _id = "_id"
		case created_at = "created_at"
		case image = "image"
		case content = "content"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		__v = try values.decodeIfPresent(Int.self, forKey: .__v)
		user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
		gu = try values.decodeIfPresent(String.self, forKey: .gu)
		air_volume = try values.decodeIfPresent(Int.self, forKey: .air_volume)
		heat = try values.decodeIfPresent(Int.self, forKey: .heat)
		cold = try values.decodeIfPresent(Int.self, forKey: .cold)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		user_outer = try values.decodeIfPresent(Int.self, forKey: .user_outer)
		user_top = try values.decodeIfPresent(Int.self, forKey: .user_top)
		user_bottom = try values.decodeIfPresent(Int.self, forKey: .user_bottom)
		_id = try values.decodeIfPresent(String.self, forKey: ._id)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		image = try values.decodeIfPresent(String.self, forKey: .image)
		content = try values.decodeIfPresent(String.self, forKey: .content)
	}

}
