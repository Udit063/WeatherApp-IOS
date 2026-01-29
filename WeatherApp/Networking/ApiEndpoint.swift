//
//  ApiEndpoint.swift
//  WeatherApp
//
//  Created by rentamac on 1/29/26.
//

import Foundation

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }

    var url: URL? { get }
}

extension APIEndpoint {
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}
