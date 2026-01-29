import Foundation

final class WeatherService: WeatherServiceProtocol {

    private let networking: Networking

    init(networking: Networking = HTTPNetworking()) {
        self.networking = networking
    }

    func fetchWeather(
        latitude: Double,
        longitude: Double
    ) async throws -> WeatherResponse {

        let endpoint = WeatherEndpoint(
            latitude: latitude,
            longitude: longitude
        )

        return try await networking.request(
            endpoint: endpoint,
            responseType: WeatherResponse.self
        )
    }
}
