

import Foundation
struct Uvindex : Codable {
	let grid : Grid?
	let day00 : Day00?
	let day01 : Day01?
	let day02 : Day02?

	enum CodingKeys: String, CodingKey {

		case grid = "grid"
		case day00 = "day00"
		case day01 = "day01"
		case day02 = "day02"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		grid = try values.decodeIfPresent(Grid.self, forKey: .grid)
		day00 = try values.decodeIfPresent(Day00.self, forKey: .day00)
		day01 = try values.decodeIfPresent(Day01.self, forKey: .day01)
		day02 = try values.decodeIfPresent(Day02.self, forKey: .day02)
	}

}
