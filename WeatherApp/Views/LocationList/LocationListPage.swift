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
    @StateObject private var store = LocationStore()
    @StateObject private var cache = WeatherCache.shared
    @State private var searchText = ""
    @State private var showAddLocation = false
    
    var filteredLocations: [Location] {
        searchText.isEmpty
        ? store.locations
        : store.locations.filter {
            $0.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    var body: some View {
        ZStack{
            Color(.background)
                            .ignoresSafeArea()
            
            VStack{
                SearchBar(text: $searchText)
                List(filteredLocations, id: \.id){ location in
                    NavigationLink(destination: WeatherView(location: location)){
                        HStack{
                            Image(systemName: location.weather.icon)
                                .foregroundColor(location.weather.iconColor)
                            Text(location.name)
                            Spacer()
                            Text( cache.getTemperature(for: location.id)
                                .map { String(format: "%.2f°C", $0) } ?? "--")
                                            .foregroundColor(.secondary)
//                            Text("\(location.temperature.min)°/\(location.temperature.max)°")
//                            Text(location.temperature.temperaturText)
//                                    .foregroundColor(.secondary)
                                
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
        .toolbar {
                   ToolbarItem(placement: .navigationBarTrailing) {
                       Button {
                           showAddLocation = true
                       } label: {
                           Image(systemName: "plus")
                       }
                   }
               }
               .sheet(isPresented: $showAddLocation) {
                   AddLocationView(store: store)
               }
               .onAppear {
                   print("📄 List locations count:", store.locations.count)
               }
    }
}

#Preview {
    
    NavigationStack {
        LocationListPage()
    }
}
