//
//  ProductDetailViewModel.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import UIKit
import Combine
import os.log

protocol ProductDetailsViewModelProtocol {
    var product: Product { get }
    var productDetails: String? { get }
    var showError: ((Constants.UIError) -> Void)? { get set }
    
    func loadProductDetails(productID: String, completion: @escaping (String) -> Void)
}

class ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    
    //    @Published var detailsProduct: DetailsProduct?
    var product: Product
    @Published var productDetails: String?
    
    var cancellable: Set<AnyCancellable> = []
    var showError: ((Constants.UIError) -> Void)?
    let network: NetworkRequest
    
    init(product: Product, network: NetworkRequest) {
        self.product = product
        self.network = network
        Logger.shared.log("ProductDetailsViewModel initialized with product and network service.", level: .info)
    }
    
    func loadProductDetails(productID: String, completion: @escaping (String) -> Void) {
        Logger.shared.log("Attempting to fetch product details for product ID: \(productID)", level: .info)
        Task { // @MainActor in
            do {
                let productDetailsResult = try await self.network.fetchData(from: Constants.MLBaseURL.GetProductDetails.path(forProductID: productID), decodeAs: ProductDetails.self)
                DispatchQueue.main.async {
                    //                    self.productDetails = detailsReturn
                    completion(productDetailsResult.plainText)
                    Logger.shared.log("Product details successfully loaded for product ID: \(productID)", level: .info)
                }
                
            } catch let error as APIError {
                completion(ProductDetails().plainText)
                showError?(error.toUIError())
            }
        }
    }
}
