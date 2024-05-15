//
//  Product.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

struct ProductResult: Codable {
    
    let results: [Product]
}

struct Product: Codable {
    
    let id: String
    let title: String?
    let price: Double?
    let thumbnail: String?
}
