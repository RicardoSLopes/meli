//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import UIKit
import Combine
import os.log

class ProductDetailsViewModel {
    
    @Published var detailsProduct: DetailsProduct?
    
    var cancellable: Set<AnyCancellable> = []
    var showError: ((Constants.UIError) -> Void)?
    let network: NetworkRequest
    
    init(network: NetworkRequest) {
        self.network = network
        Logger.shared.log("ProductDetailsViewModel initialized with network service.", level: .info)
    }
    
    deinit {
        cancellable.forEach({ $0.cancel() })
        Logger.shared.log("ProductDetailsViewModel deallocated.", level: .info)
    }
    
    func getProductDetails(productID: String, completion: @escaping (DetailsProduct?, Error?) -> Void) {
        Logger.shared.log("Attempting to fetch product details for product ID: \(productID)", level: .info)
        Task {
            do {
                let detailsProductResult = try await network.fetchData(from: Constants.MLBaseURL.GetProductDetails.path(forProductID: productID), decodeAs: DetailsProduct.self)
                DispatchQueue.main.async {
                    self.detailsProduct = detailsProductResult
                    completion(detailsProductResult, nil)
                    Logger.shared.log("Product details successfully loaded for product ID: \(productID)", level: .info)
                }
            } catch {
                Logger.shared.log("Error fetching product details: \(error.localizedDescription)", level: .error)
                DispatchQueue.main.async {
                    completion(nil, error)
                }
            }
        }
    }
}
