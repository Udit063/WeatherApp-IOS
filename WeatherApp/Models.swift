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
    let weather: Weather
    let temperature: Temperature
    let description: String
}


    let LocationList: [Location] = [
        Location(name: "Mumbai", weather: .sunny, temperature: Temperature(min: 22, max: 32), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "New Delhi", weather: .foggy, temperature: Temperature(min: 11, max: 24), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Chennai", weather: .sunny, temperature: Temperature(min: 24, max: 36), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Pune", weather: .sunny, temperature: Temperature(min: 22, max: 32), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Bengaluru", weather: .rainy, temperature: Temperature(min: 24, max: 30), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Gurgaon", weather: .foggy, temperature: Temperature(min: 11, max: 23), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Noida", weather: .snow, temperature: Temperature(min: 9, max: 22), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Hyderabad", weather: .windy, temperature: Temperature(min: 22, max: 32), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Indore", weather: .sunny, temperature: Temperature(min: 18, max: 24), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),
        Location(name: "Ahemedabad", weather: .sunny, temperature: Temperature(min: 20, max: 32), description: "A warm breeze drifted through the streets as the afternoon sun hovered behind a veil of scattered clouds. In the north, the air felt dry and dusty, while the southern coast carried the familiar scent of moisture from the sea. Somewhere in the distance, dark monsoon clouds gathered slowly, hinting at the evening shower that would cool the earth and fill the air with the sound of rain tapping on rooftops."),

    ]

