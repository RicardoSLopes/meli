//
//  URLBuilder.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import Foundation

struct URLBuilder {
    static func makeURL(baseURL: String, path: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        return components?.url
    }
}
