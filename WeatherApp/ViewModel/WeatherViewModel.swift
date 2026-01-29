import Foundation
import SwiftUI
import Combine

@MainActor
final class WeatherViewModel: ObservableObject {

    @Published var temperatureText: String = "--"
    @Published var cityName: String = ""
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let service: WeatherServiceProtocol

    init(service: WeatherServiceProtocol = WeatherService()) {
        self.service = service
    }

    func fetchWeather(for location: Location) async {
        isLoading = true
        errorMessage = nil
        cityName = location.name

        do {
            let response = try await service.fetchWeather(
                latitude: location.latitude,
                longitude: location.longitude
            )

            temperatureText =
            "\(response.current.temperature2M) \(response.currentUnits.temperature2M)"

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
