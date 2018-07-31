

import Foundation
struct Minutely : Codable {
	let sky : Sky?
	let rain : Rain?
	let temperature : Temperature?
	let humidity : String?
	let pressure : Pressure?
	let lightning : String?
	let timeObservation : String?
	let station : Station?
	let wind : Wind?
	let precipitation : Precipitation?

	enum CodingKeys: String, CodingKey {

		case sky = "sky"
		case rain = "rain"
		case temperature = "temperature"
		case humidity = "humidity"
		case pressure = "pressure"
		case lightning = "lightning"
		case timeObservation = "timeObservation"
		case station = "station"
		case wind = "wind"
		case precipitation = "precipitation"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		sky = try values.decodeIfPresent(Sky.self, forKey: .sky)
		rain = try values.decodeIfPresent(Rain.self, forKey: .rain)
		temperature = try values.decodeIfPresent(Temperature.self, forKey: .temperature)
		humidity = try values.decodeIfPresent(String.self, forKey: .humidity)
		pressure = try values.decodeIfPresent(Pressure.self, forKey: .pressure)
		lightning = try values.decodeIfPresent(String.self, forKey: .lightning)
		timeObservation = try values.decodeIfPresent(String.self, forKey: .timeObservation)
		station = try values.decodeIfPresent(Station.self, forKey: .station)
		wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
		precipitation = try values.decodeIfPresent(Precipitation.self, forKey: .precipitation)
	}

}
