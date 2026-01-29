//
//  Networking.swift.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

protocol Networking {
    func request<T: Decodable>(
        endpoint: APIEndpoint,
        responseType: T.Type
    ) async throws -> T
}
