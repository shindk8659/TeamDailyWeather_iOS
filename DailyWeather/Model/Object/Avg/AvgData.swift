/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct AvgData: Codable {
	let success : Bool?
	let message : String?
	let errors : String?
	let gu : String?
	let humidity : Int?
	let air_volume : Int?
	let cold : Int?
	let heat : Int?
	let user_outer : Int?
	let user_top : Int?
	let user_bottom : Int?

	enum CodingKeys: String, CodingKey {

		case success = "success"
		case message = "message"
		case errors = "errors"
		case gu = "gu"
		case humidity = "humidity"
		case air_volume = "air_volume"
		case cold = "cold"
		case heat = "heat"
		case user_outer = "user_outer"
		case user_top = "user_top"
		case user_bottom = "user_bottom"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		success = try values.decodeIfPresent(Bool.self, forKey: .success)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		errors = try values.decodeIfPresent(String.self, forKey: .errors)
		gu = try values.decodeIfPresent(String.self, forKey: .gu)
		humidity = try values.decodeIfPresent(Int.self, forKey: .humidity)
		air_volume = try values.decodeIfPresent(Int.self, forKey: .air_volume)
		cold = try values.decodeIfPresent(Int.self, forKey: .cold)
		heat = try values.decodeIfPresent(Int.self, forKey: .heat)
		user_outer = try values.decodeIfPresent(Int.self, forKey: .user_outer)
		user_top = try values.decodeIfPresent(Int.self, forKey: .user_top)
		user_bottom = try values.decodeIfPresent(Int.self, forKey: .user_bottom)
	}

}
