/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Forecast : Codable {
	let timeRelease : String?
	let index4hour : String?
	let index7hour : String?
	let index10hour : String?
	let index13hour : String?
	let index16hour : String?
	let index19hour : String?
	let index22hour : String?
	let index25hour : String?
	let index28hour : String?
	let index31hour : String?
	let index34hour : String?
	let index37hour : String?
	let index40hour : String?
	let index43hour : String?
	let index46hour : String?
	let index49hour : String?
	let index52hour : String?
	let index55hour : String?
	let index58hour : String?
	let index61hour : String?
	let index64hour : String?
	let index67hour : String?

	enum CodingKeys: String, CodingKey {

		case timeRelease = "timeRelease"
		case index4hour = "index4hour"
		case index7hour = "index7hour"
		case index10hour = "index10hour"
		case index13hour = "index13hour"
		case index16hour = "index16hour"
		case index19hour = "index19hour"
		case index22hour = "index22hour"
		case index25hour = "index25hour"
		case index28hour = "index28hour"
		case index31hour = "index31hour"
		case index34hour = "index34hour"
		case index37hour = "index37hour"
		case index40hour = "index40hour"
		case index43hour = "index43hour"
		case index46hour = "index46hour"
		case index49hour = "index49hour"
		case index52hour = "index52hour"
		case index55hour = "index55hour"
		case index58hour = "index58hour"
		case index61hour = "index61hour"
		case index64hour = "index64hour"
		case index67hour = "index67hour"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timeRelease = try values.decodeIfPresent(String.self, forKey: .timeRelease)
		index4hour = try values.decodeIfPresent(String.self, forKey: .index4hour)
		index7hour = try values.decodeIfPresent(String.self, forKey: .index7hour)
		index10hour = try values.decodeIfPresent(String.self, forKey: .index10hour)
		index13hour = try values.decodeIfPresent(String.self, forKey: .index13hour)
		index16hour = try values.decodeIfPresent(String.self, forKey: .index16hour)
		index19hour = try values.decodeIfPresent(String.self, forKey: .index19hour)
		index22hour = try values.decodeIfPresent(String.self, forKey: .index22hour)
		index25hour = try values.decodeIfPresent(String.self, forKey: .index25hour)
		index28hour = try values.decodeIfPresent(String.self, forKey: .index28hour)
		index31hour = try values.decodeIfPresent(String.self, forKey: .index31hour)
		index34hour = try values.decodeIfPresent(String.self, forKey: .index34hour)
		index37hour = try values.decodeIfPresent(String.self, forKey: .index37hour)
		index40hour = try values.decodeIfPresent(String.self, forKey: .index40hour)
		index43hour = try values.decodeIfPresent(String.self, forKey: .index43hour)
		index46hour = try values.decodeIfPresent(String.self, forKey: .index46hour)
		index49hour = try values.decodeIfPresent(String.self, forKey: .index49hour)
		index52hour = try values.decodeIfPresent(String.self, forKey: .index52hour)
		index55hour = try values.decodeIfPresent(String.self, forKey: .index55hour)
		index58hour = try values.decodeIfPresent(String.self, forKey: .index58hour)
		index61hour = try values.decodeIfPresent(String.self, forKey: .index61hour)
		index64hour = try values.decodeIfPresent(String.self, forKey: .index64hour)
		index67hour = try values.decodeIfPresent(String.self, forKey: .index67hour)
	}

}