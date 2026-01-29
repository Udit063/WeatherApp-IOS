//
//  CurrentUnits.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

struct CurrentUnits: Decodable {
    let temperature2M: String

    enum CodingKeys: String, CodingKey {
        case temperature2M = "temperature_2m"
    }
}
