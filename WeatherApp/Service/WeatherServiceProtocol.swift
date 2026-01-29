//
//  WeatherServiceProtocol.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchWeather(
        latitude: Double,
        longitude: Double,
        locationID: UUID
    ) async throws -> Double
}
