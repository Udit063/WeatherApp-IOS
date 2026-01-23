//
//  DetailPage.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct DetailPage: View {
    let location : Location
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.027, green: 0.082, blue: 0.207, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing: 20){
                Image(systemName: location.weather.icon)
                    .font(.system(size: 80))
                    .foregroundColor(.white)
                    .padding()
                
                Text(location.name)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                Text("\(location.temperature.max)°C / \(location.temperature.min)°C")
                    .font(.title)
                    .foregroundColor(.white.opacity(0.6))
                
                Text(location.description)
                    .font(.body)
                    .foregroundColor(.white)
                    .padding()
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailPage(location: Location(
            name: "Mumbai",
            weather: .sunny,
            temperature: Temperature(min:22, max:32),
            description: "A warm and humid day with clear skies."
        ))
    }
}

