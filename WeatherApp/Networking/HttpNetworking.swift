//
//  HttpNetworking.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

final class HTTPNetworking: Networking {

    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T {

        guard let url = endpoint.url else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        if let jsonString = String(data: data, encoding: .utf8) {
            print("🔵 RAW API RESPONSE:")
            print(jsonString)
        }

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(T.self, from: data)
        
        print("🟢 DECODED RESPONSE:")
        print(decoded)

        return decoded
    }
}
