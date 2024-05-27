//
//  MockProduct.swift
//  MeliTests
//
//  Created by Ricardo Santana on 26/05/24.
//

@testable import Meli



struct MockProduct {
    static let product1 = Product(id: "1", title: "Product 1", price: 10.0, thumbnail: "http://meli.com/thumbnail1.jpg")
    static let product2 = Product(id: "2", title: "Product 2", price: 20.0, thumbnail: "http://meli.com/thumbnail2.jpg")
    static let product3 = Product(id: "3", title: "Product 3", price: 30.0, thumbnail: "http://meli.com/thumbnail3.jpg")
    
    static let mockProduct = ProductResult(results: [product1, product2, product3])
}

