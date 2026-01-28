//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by rentamac on 1/28/26.
//

import Foundation

struct WeatherResponse: Codable {
    let currentWeather: CurrentWeather
    
    enum CodingKeys: String, CodingKey {
        case currentWeather = "current_weather"
    }
}

struct CurrentWeather: Codable {
    let temperature: Double
    let windspeed: Double
    let weathercode: Int
}
