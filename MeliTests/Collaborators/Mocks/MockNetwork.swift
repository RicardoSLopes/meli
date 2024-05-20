//
//  MockNetwork.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import Foundation

class MockNetwork: NetworkRequest {
    var fetchDataWithQueryItemsWasCalled = false
    var fetchDataWasCalled = false
    var throwError: APIError?
    var isSuccess = false
    
    func fetchData<T>(from path: String, queryItems: [URLQueryItem], decodeAs type: T.Type) async throws -> T where T : Decodable {
        fetchDataWithQueryItemsWasCalled = true
        
        if let error = throwError {
            throw throwError ?? APIError.decodingError
        }
        else {
            isSuccess = true
        }
        return isSuccess as! T
    }
    
    func fetchData<T>(from path: String, decodeAs type: T.Type) async throws -> T where T : Decodable {
        fetchDataWithQueryItemsWasCalled = true
        
        if let error = throwError {
            throw throwError ?? APIError.decodingError
        }
        else {
            isSuccess = true
        }
        return isSuccess as! T
    }
}
