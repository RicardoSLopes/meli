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
    
    // MARK: HTTPMethod
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    // MARK: Error Screen
    enum UIError {
        case invalidURL
        case noData
        case serverError
        case unknown

        var title: String {
            switch self {
            case .invalidURL:
                return LocalizationKey.invalidURL.value()
            case .noData:
                return LocalizationKey.NoData.value()
            case .serverError:
                return LocalizationKey.serverError.value()
            case .unknown:
                return LocalizationKey.unknownError.value()
            }
        }

        var message: String {
            switch self {
            case .invalidURL:
                return LocalizationKey.invalidURLMessage.value()
            case .noData:
                return LocalizationKey.NoDataMessage.value()
            case .serverError:
                return LocalizationKey.serverErrorMessage.value()
            case .unknown:
                return LocalizationKey.unknownErrorMessage.value()
            }
        }

        var imageName: String {
            switch self {
            case .invalidURL:
                return LocalizationKey.invalidURLImage.value()
            case .noData:
                return LocalizationKey.NoDataImage.value()
            case .serverError:
                return LocalizationKey.serverErrorImage.value()
            case .unknown:
                return LocalizationKey.unknownErrorImage.value()
            }
        }
    }

}
