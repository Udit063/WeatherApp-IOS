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
            Color(red: 0.03, green: 0.08, blue: 0.20)
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
