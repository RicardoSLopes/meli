//
//  MockSearchViewModel.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli

import Combine

class MockSearchViewModel: SearchViewModel {
    
    var searchProductsWasCalled = false
    var throwError: APIError?
    var isSuccess = false
    
    
    override func searchProducts(searchTerm: String) {
        searchProductsWasCalled = true
        
        if let error = throwError {
            switch error {
            case .invalidURL:
                showError?(.invalidURL)
            case .noData:
                showError?(.noData)
            case .serverError(let statusCode):
                showError?(statusCode == 404 ? .noData : .serverError)
            default:
                showError?(.unknown)
            }
        } else {
            isSuccess = true
        }
    }
}
