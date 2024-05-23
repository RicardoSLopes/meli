//
//  ProductDetails.swift
//  Meli
//
//  Created by Ricardo Santana on 16/05/24.
//

import Foundation

struct ProductDetails: Decodable {
    let plainText: String
    
    private enum CodingKeys: String, CodingKey {
        case plainText = "plain_text"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let plainTextValue = try container.decode(String.self, forKey: .plainText)
        
        plainText = plainTextValue.isEmpty || plainTextValue == "" ? LocalizationKey.noProductDetails.value() : plainTextValue
    }
    
    init() {
        self.plainText = LocalizationKey.noProductDetails.value()
    }
    
    
}
