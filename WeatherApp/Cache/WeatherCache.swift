import Foundation
import Combine

final class WeatherCache: ObservableObject {

    static let shared = WeatherCache()
    private init() {}

    @Published private var cache: [UUID: Double] = [:]

    func getTemperature(for locationID: UUID) -> Double? {
        cache[locationID]
    }

    func saveTemperature(_ temperature: Double, for locationID: UUID) {
        cache[locationID] = temperature
    }
}

