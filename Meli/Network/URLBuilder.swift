//
//  URLBuilder.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import UIKit
import os.log

struct URLBuilder {
    static func makeURL(baseURL: String, path: String, queryItems: [URLQueryItem]) -> URL? {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            Logger.shared.log("Failed to create URL with base: \(baseURL), path: \(path), and query items: \(queryItems)", level: .error)
            return nil
        }
        
        if !UIApplication.shared.canOpenURL(url) {
            Logger.shared.log("Constructed URL is not valid or cannot be opened: \(url)", level: .error)
            return nil
        }
        
        Logger.shared.log("URL successfully constructed: \(url)", level: .info)
        return url
    }
}

