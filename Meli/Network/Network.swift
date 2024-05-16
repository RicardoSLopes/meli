//
//  Network.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decodingError
    case serverError(Int)
}

protocol NetworkRequest {
    func searchForData(searchTerm: String) async throws -> [Product]
}

class Network: NetworkRequest {
    
    func searchForData(searchTerm: String) async throws -> [Product] {
        
//        guard var url = URL(string: Constants.baseURL) else {
//            throw APIError.invalidURL
//        }
        
//        //So funciona so no iOS 16
//        url.append(path: Constants.searchEndpoint)
//        url.append(queryItems: [URLQueryItem(name: "q", value: searchTerm)])
        let path = Constants.MLBaseURL.SearchItems.path
        let queryItems = [URLQueryItem(name: Constants.MLBaseURL.SearchItems.queryItemName, value: searchTerm)]

        if let url = Constants.MLBaseURL.makeURL(path: path, queryItems: queryItems) {
            print("\(url)")
            
            // criar enum dos methodos
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard let statusCode = response as? HTTPURLResponse else {
                throw APIError.invalidResponse
            }
            
            guard (200...299).contains(statusCode.statusCode) else {
                throw APIError.serverError(statusCode.statusCode)
            }
            
            
            do {
                let productData = try JSONDecoder().decode(ProductResult.self, from: data)
                return productData.results
            } catch {
                print("error \(error)")
                return []
            }
        } else {
            throw APIError.invalidURL
        }
        
        
    }
    
}
