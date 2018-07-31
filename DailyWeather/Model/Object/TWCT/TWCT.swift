

import Foundation
struct TWCT : Codable {
	let weather : WCTWeather?
	let common : Common?
	let result : Result?

	enum CodingKeys: String, CodingKey {

		case weather = "weather"
		case common = "common"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		weather = try values.decodeIfPresent(WCTWeather.self, forKey: .weather)
		common = try values.decodeIfPresent(Common.self, forKey: .common)
		result = try values.decodeIfPresent(Result.self, forKey: .result)
	}

}
