

import Foundation
struct Rain : Codable {
	let sinceOntime : String?
	let last30min : String?
	let last1hour : String?
	let last6hour : String?
	let last12hour : String?
	let last24hour : String?
	let sinceMidnight : String?
	let last10min : String?
	let last15min : String?

	enum CodingKeys: String, CodingKey {

		case sinceOntime = "sinceOntime"
		case last30min = "last30min"
		case last1hour = "last1hour"
		case last6hour = "last6hour"
		case last12hour = "last12hour"
		case last24hour = "last24hour"
		case sinceMidnight = "sinceMidnight"
		case last10min = "last10min"
		case last15min = "last15min"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sinceOntime = try values.decodeIfPresent(String.self, forKey: .sinceOntime)
		last30min = try values.decodeIfPresent(String.self, forKey: .last30min)
		last1hour = try values.decodeIfPresent(String.self, forKey: .last1hour)
		last6hour = try values.decodeIfPresent(String.self, forKey: .last6hour)
		last12hour = try values.decodeIfPresent(String.self, forKey: .last12hour)
		last24hour = try values.decodeIfPresent(String.self, forKey: .last24hour)
		sinceMidnight = try values.decodeIfPresent(String.self, forKey: .sinceMidnight)
		last10min = try values.decodeIfPresent(String.self, forKey: .last10min)
		last15min = try values.decodeIfPresent(String.self, forKey: .last15min)
	}

}
