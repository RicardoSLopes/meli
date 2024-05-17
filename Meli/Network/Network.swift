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
    func fetchData<T: Decodable>(from path: String, queryItems: [URLQueryItem], decodeAs type: T.Type) async throws -> T
    func fetchData<T: Decodable>(from path: String, decodeAs type: T.Type) async throws -> T
}

class Network: NetworkRequest {
    func fetchData<T: Decodable>(from path: String, decodeAs type: T.Type) async throws -> T {
        try await fetchData(from: path, queryItems: [], decodeAs: type)
    }
    
    func fetchData<T: Decodable>(from path: String, queryItems: [URLQueryItem], decodeAs type: T.Type) async throws -> T {
        guard let url = URLBuilder.makeURL(baseURL: Constants.MLBaseURL.baseURL,
                                           path: path,
                                           queryItems: queryItems)
                
        else {
            throw APIError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.HTTPMethod.get.rawValue
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(statusCode.statusCode) else {
            throw APIError.serverError(statusCode.statusCode)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
