

import Foundation


struct TUV : Codable {
	let weather : UVWeather?
	let common : UVCommon?
	let result : Result?

	enum CodingKeys: String, CodingKey {

		case weather = "weather"
		case common = "common"
		case result = "result"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		weather = try values.decodeIfPresent(UVWeather.self, forKey: .weather)
		common = try values.decodeIfPresent(UVCommon.self, forKey: .common)
		result = try values.decodeIfPresent(Result.self, forKey: .result)
	}

}
