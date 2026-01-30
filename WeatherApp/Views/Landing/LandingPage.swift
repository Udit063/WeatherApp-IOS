//
//  LandingPage.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        ZStack {
            Color(.background)
                .ignoresSafeArea()
            VStack(spacing: 25){
                Spacer()
                Image("umbrella")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Welcome to the Weather App")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Spacer()
                
                NavigationLink(destination: LocationListPage()){
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 65))
                        .foregroundStyle(.white, .blue)
                }
                
                Spacer().frame(height: 40)
            }
            .padding()
        }
    }
}

#Preview {
    LandingPage()
}
