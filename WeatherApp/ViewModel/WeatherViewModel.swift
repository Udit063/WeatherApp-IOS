import Foundation
import SwiftUI
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {

    @Published var liveTemperature: String = "--"
    let location: Location

    private let service: WeatherServiceProtocol

    init(
        location: Location,
        service: WeatherServiceProtocol = WeatherService()
    ) {
        self.location = location
        self.service = service
    }

    func fetchWeather() async {
        do {
            let response = try await service.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

//            liveTemperature = "\(response.current.temperature2M - 2) / \(response.current.temperature2M + 2) °C"
            liveTemperature = "\(response.current.temperature2M) °C"

        } catch {
            print("API Error:", error)
        }
    }
}
