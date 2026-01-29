import Foundation
import SwiftUI
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {

    let location: Location

    @Published var temperatureText: String = "--"
    @Published var errorMessage: String?
    @Published var isLoading = false

    private let service: WeatherServiceProtocol

    init(
        location: Location,
        service: WeatherServiceProtocol = WeatherService()
    ) {
        self.location = location
        self.service = service
    }

    func fetchWeather() async {
        isLoading = true
        errorMessage = nil

        do {
            let temp = try await service.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude,
                locationID: location.id
            )

            temperatureText = String(format: "%.2f°C", temp)

        } catch {
            errorMessage = "Unable to fetch weather.\nPlease try again later."
        }

        isLoading = false
    }
}
