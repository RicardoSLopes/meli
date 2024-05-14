//
//  Product.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

struct Product: Codable {
    
    let id: String
    let title: String?
    let price: Int?
    let thumbnail: String?
}
