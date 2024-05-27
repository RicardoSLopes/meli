//
//  MockProductDetailsViewModel.swift
//  MeliTests
//
//  Created by Ricardo Santana on 26/05/24.
//

@testable import Meli

class MockProductDetailsViewModel: ProductDetailsViewModel {
    var loadProductDetailsWasCalled = false
    var producReceivesFromInit: Product?
    var producDetailsReceivesFromInit: String?
    
    init(product: Product, productDetails: String? = nil) {
        super.init(product: MockProduct.product1, network: MockNetwork())
        self.producReceivesFromInit = product
        self.producDetailsReceivesFromInit = productDetails
    }
    
    override func loadProductDetails(productID: String, completion: @escaping (String) -> Void) {
        loadProductDetailsWasCalled = true
    }
}
