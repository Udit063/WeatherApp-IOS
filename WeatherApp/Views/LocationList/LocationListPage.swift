//
//  LocationListPage.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content
    ) -> some View {
        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}


struct LocationListPage: View {
    @State private var searchText = ""
    
    var filiteredLocations: [Location]{
        if searchText.isEmpty{
            return LocationList
        }
        return LocationList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        ZStack{
            Color(red: 0.03, green: 0.08, blue: 0.20)
                            .ignoresSafeArea()
            
            VStack{
                SearchBar(text: $searchText)
                List(filiteredLocations){ location in
                    NavigationLink(destination: WeatherView(location: location)){
                        HStack{
//                            Image(systemName: location.weather.icon)
//                                .foregroundColor(location.weather.iconColor)
                            Text(location.name)
                            Spacer()
//                            Text("\(location.temperature.min)°/\(location.temperature.max)°")
                                
                        }
                    }
                }
                .scrollContentBackground(.hidden)  
                .background(Color.clear)
            }
        }
        .navigationTitle("Locations")
        .toolbarColorScheme(.dark)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    NavigationStack {
        LocationListPage()
    }
}
