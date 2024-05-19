//
//  SearchViewModel.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit
import Combine
import os.log

class SearchViewModel {
    
    @Published var products: [Product] = []
    var cancellable: Set<AnyCancellable> = []
    var showError: ((Constants.UIError) -> Void)?
    let network: NetworkRequest
    
    init(network: NetworkRequest) {
        self.network = network
        Logger.shared.log("SearchViewModel initialized.", level: .info)
    }
    
    deinit {
        cancellable.forEach({ $0.cancel() })
        Logger.shared.log("SearchViewModel deinitialized.", level: .info)
    }
    
    func searchProducts(searchTerm: String) {
        Logger.shared.log("Starting product search for term: \(searchTerm)", level: .info)
        let queryItem = [URLQueryItem(name: Constants.MLBaseURL.SearchItems.queryItemName, value: searchTerm)]
        Task {
            do {
                let productResult = try await network.fetchData(from: Constants.MLBaseURL.SearchItems.path,
                                                                queryItems: queryItem,
                                                                decodeAs: ProductResult.self)
                DispatchQueue.main.async {
                    self.products = productResult.results
                    Logger.shared.log("Products loaded successfully.", level: .info)
                }
            } catch APIError.invalidURL {
                Logger.shared.log("Invalid URL error during product search.", level: .error)
                showError?(.invalidURL)
            } catch APIError.noData {
                Logger.shared.log("No data returned from server.", level: .error)
                showError?(.noData)
            } catch APIError.serverError(let statusCode) {
                Logger.shared.log("Server error with status code: \(statusCode) during product search.", level: .error)
                showError?(statusCode == 404 ? .noData : .serverError)
            } catch {
                Logger.shared.log("An unknown error occurred during product search.", level: .error)
                showError?(.unknown)
            }
        }
    }
}
