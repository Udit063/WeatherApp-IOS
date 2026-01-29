//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

struct CurrentWeather: Decodable {
    let temperature2M: Double

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
    }
}
