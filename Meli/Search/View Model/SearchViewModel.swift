//
//  SearchViewModel.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation
import Combine

class SearchViewModel {
    
    @Published var products: [Product] = []
    
    var cancellable: Set<AnyCancellable> = []
    let network: NetworkRequest
    
    init(network: NetworkRequest) {
        self.network = network
    }
    
    deinit {
        cancellable.forEach({ $0.cancel() })
    }
    
    func searchProducts(searchTerm: String) {
        let queryItem = [URLQueryItem(name: Constants.MLBaseURL.SearchItems.queryItemName, value: searchTerm)]
        Task {
            do {
                let productResult = try await network.fetchData(from: Constants.MLBaseURL.SearchItems.path, 
                                                                queryItems: queryItem,
                                                                decodeAs: ProductResult.self)
                DispatchQueue.main.async {
                    self.products = productResult.results
                    print("Produtos carregados")
                }
            } catch {
                print("Erro ao buscar produtos: \(error)")
            }
        }
    }
}
