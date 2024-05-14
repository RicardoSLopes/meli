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
        //@Main Actor atualiza as informaçoes na main thread
        ///substitui o  DispatchQueue.main.async
        Task { @MainActor in
            self.products = try await network.searchForData(searchTerm: searchTerm)
        }
    }
}
