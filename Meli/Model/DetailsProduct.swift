//
//  DetailsProduct.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import Foundation

struct DetailsProduct: Decodable {
    let text: String
    let plainText: String
    
    private enum CodingKeys: String, CodingKey {
        case text, plainText = "plain_text"
    }
}
