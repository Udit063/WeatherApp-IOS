//
//  AddLocationView.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import SwiftUI

struct AddLocationView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var store: LocationStore

    @State private var name = ""
    @State private var latitude = ""
    @State private var longitude = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("City Name", text: $name)
                TextField("Latitude", text: $latitude)
                    .keyboardType(.decimalPad)
                TextField("Longitude", text: $longitude)
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add Location")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") { save() }
                        .disabled(!isValid)
                }
            }
        }
    }

    private var isValid: Bool {
        !name.isEmpty &&
        Double(latitude) != nil &&
        Double(longitude) != nil
    }

    private func save() {
        store.addLocation(
            name: name,
            latitude: Double(latitude)!,
            longitude: Double(longitude)!
        )
        dismiss()
    }
}
