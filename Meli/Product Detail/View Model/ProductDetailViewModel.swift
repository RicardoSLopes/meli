//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import Foundation
import Combine

class ProductDetailViewModel {
    
    @Published var detailsProduct: DetailsProduct?
    
    var cancellable: Set<AnyCancellable> = []
    let network: NetworkRequest
    
    init(network: NetworkRequest) {
        self.network = network
    }
    
    deinit {
        cancellable.forEach({ $0.cancel() })
    }
    
    func getProductDetails(productID: String, completion: @escaping (DetailsProduct?, Error?) -> Void) {
        Task {
            do {
                let detailsProductResult = try await network.fetchData(from: Constants.MLBaseURL.GetProductDetails.path(forProductID: productID), decodeAs: DetailsProduct.self)
                DispatchQueue.main.async {
                    self.detailsProduct = detailsProductResult
                    completion(detailsProductResult, nil)
                }
            } catch {
                print("Erro ao buscar detalhes do produto: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}

