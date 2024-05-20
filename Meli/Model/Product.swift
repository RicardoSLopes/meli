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

struct Product: Codable, Equatable {
    let id: String
    let title: String?
    let price: Double?
    let thumbnail: String?

    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.id == rhs.id &&
               lhs.title == rhs.title &&
               lhs.price == rhs.price &&
               lhs.thumbnail == rhs.thumbnail
    }
}
