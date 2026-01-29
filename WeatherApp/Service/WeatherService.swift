import Foundation

final class WeatherService: WeatherServiceProtocol {

    private let networking: Networking
    private let cache = WeatherCache.shared

    init(networking: Networking = HTTPNetworking()) {
        self.networking = networking
    }

    func fetchWeather(
        latitude: Double,
        longitude: Double,
        locationID: UUID
    ) async throws -> Double {
        
        if let cachedTemp = cache.getTemperature(for: locationID) {
            print("🟢 Using cached temperature")
            return cachedTemp
        }
        
        let endpoint = WeatherEndpoint(
                   latitude: latitude,
                   longitude: longitude
               )

        let response = try await networking.request(
            endpoint: endpoint,
            responseType: WeatherResponse.self
        )

        let temperature = response.current.temperature2M

        // 3️⃣ Save to cache
        cache.saveTemperature(temperature, for: locationID)

        return temperature

    }
}
