//
//  LocationStore.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation
import Combine

final class LocationStore: ObservableObject {

    @Published var locations: [Location]

    init() {
        self.locations = LocationList
    }

    func addLocation(
        name: String,
        latitude: Double,
        longitude: Double
    ) {
        let newLocation = Location(
            name: name,
            latitude: latitude,
            longitude: longitude,
            weather: .sunny,
            temperature: Temperature(min: 0, max: 0)
        )

        locations.append(newLocation)
        print("✅ Added location:", newLocation.name)
               print("📍 Total locations:", locations.count)
    }
}
