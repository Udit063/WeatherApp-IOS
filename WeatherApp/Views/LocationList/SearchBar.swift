//
//  SearchBar.swift
//  WeatherApp
//
//  Created by rentamac on 1/23/26.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.white.opacity(0.7))

            TextField("Search city", text: $text)
                .foregroundColor(.white)
                .tint(.white)

            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.white.opacity(0.7))
                }
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.12))
        .cornerRadius(12)
        .padding(.horizontal)
    }
}


#Preview {
    @State var text = "Search Bar"
    SearchBar(text: $text)
}
