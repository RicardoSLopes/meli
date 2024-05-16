//
//  Constants.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation


struct Constants {
    
    //https://api.mercadolibre.com/sites/MLA/search?q=iphone 15
    static let baseURL = "https://api.mercadolibre.com/sites/MLB/"
    static let path = "/sites/MLB/"
    static let searchEndpoint = "search"
    
    struct MLBaseURL {
           static let baseURL = "https://api.mercadolibre.com"
           
           static func makeURL(path: String, queryItems: [URLQueryItem]) -> URL? {
               var components = URLComponents(string: baseURL)
               components?.path = path
               components?.queryItems = queryItems
               
               return components?.url
           }
        
        struct SearchItems {
            static let path = "/sites/MLB/search"
            static let queryItemName = "q"
        }
        
       }
}
