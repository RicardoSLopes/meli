//
//  Network.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation
import os.log

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case noData
    case decodingError
    case serverError(Int)
    case unknown
}

protocol NetworkRequest {
    func fetchData<T: Decodable>(from path: String, queryItems: [URLQueryItem], decodeAs type: T.Type) async throws -> T
    func fetchData<T: Decodable>(from path: String, decodeAs type: T.Type) async throws -> T
}

class Network: NetworkRequest {
    func fetchData<T: Decodable>(from path: String, decodeAs type: T.Type) async throws -> T {
        Logger.shared.log("Initiating fetch with no query items for path: \(path)", level: .info)
        return try await fetchData(from: path, queryItems: [], decodeAs: type)
    }
    
    func fetchData<T: Decodable>(from path: String, queryItems: [URLQueryItem], decodeAs type: T.Type) async throws -> T {
        Logger.shared.log("Preparing to fetch data from \(path) with query items: \(queryItems)", level: .info)

        guard let url = URLBuilder.makeURL(baseURL: Constants.MLBaseURL.baseURL, path: path, queryItems: queryItems) else {
            Logger.shared.log("Failed to construct URL with path: \(path) and query items: \(queryItems)", level: .error)
            throw APIError.invalidURL
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Constants.HTTPMethod.get.rawValue
        
        Logger.shared.log("Making network request to URL: \(url)", level: .debug)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let statusCode = response as? HTTPURLResponse else {
            Logger.shared.log("Failed to get HTTP response for URL: \(url)", level: .error)
            throw APIError.invalidResponse
        }
        
        if !(200...299).contains(statusCode.statusCode) {
            Logger.shared.log("Server returned an error with status code: \(statusCode.statusCode) for URL: \(url)", level: .error)
            throw APIError.serverError(statusCode.statusCode)
        }
        
        Logger.shared.log("Data successfully received from \(url). Processing data...", level: .info)
        do {
            let decoded = try JSONDecoder().decode(T.self, from: data)
            Logger.shared.log("Data successfully decoded for URL: \(url)", level: .debug)
            return decoded
        } catch {
            Logger.shared.log("Decoding error for URL: \(url): \(error.localizedDescription)", level: .error)
            throw APIError.decodingError
        }
    }
}

extension APIError {
    func toUIError() -> Constants.UIError {
        switch self {
        case .invalidURL, .invalidResponse:
            return .invalidURL
        case .noData:
            return .noData
        case .serverError(let statusCode):
            if statusCode == 404 {
                return .noData
            } else {
                return .serverError
            }
        case .decodingError, .requestFailed, .unknown:
            return .unknown
        }
    }
}
