//
//  Models.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import Foundation
import SwiftUI

enum Weather: String{
    case sunny = "Sunny"
    case foggy = "Foggy"
    case snow = "Snow"
    case rainy = "Rainy"
    case windy = "Windy"
    
    var icon: String{
        switch self{
        case .sunny:
            return "sun.max.fill"
        case .foggy:
            return "cloud.fog.fill"
        case .snow:
            return "snowflake"
        case .rainy:
            return "cloud.rain.fill"
        case .windy:
            return "wind"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .sunny: return .yellow
        case .foggy: return .gray
        case .snow:  return .cyan
        case .rainy: return .blue
        case .windy: return .mint
        }
    }
}

struct Temperature{
    let min: Int
    let max: Int
    
    var temperaturText: String{
        "\(min)°C/ \(max)°C"
    }
}

struct Location: Identifiable{
    let id:UUID = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var weather: Weather
    var temperature: Temperature
    var description: String
}
