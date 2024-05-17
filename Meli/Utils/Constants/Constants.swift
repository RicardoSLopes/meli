//
//  Constants.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

//https://api.mercadolibre.com/sites/MLA/search?q=iphone 15
//    static let baseURL = "https://api.mercadolibre.com/sites/MLB/"
//    static let path = "/sites/MLB/"
//    static let searchEndpoint = "search"

struct Constants {
    // MARK: structs
    struct MLBaseURL {
           static let baseURL = "https://api.mercadolibre.com"
        
        struct SearchItems {
            static let path = "/sites/MLB/search"
            static let queryItemName = "q"
        }
        
        struct GetProductDetails {
            static func path(forProductID productID: String) -> String {
                            return "/items/\(productID)/description"
                        }
        }
        
       }
    
    
    // MARK: enums
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
}
