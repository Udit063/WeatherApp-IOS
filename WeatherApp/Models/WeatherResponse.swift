import Foundation

struct WeatherResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let currentUnits: CurrentUnits
    let current: CurrentWeather

    enum CodingKeys: String, CodingKey {
        case latitude, longitude
        case currentUnits = "current_units"
        case current
    }
}
