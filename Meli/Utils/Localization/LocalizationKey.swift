//
//  LocalizationKey.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import Foundation

public enum LocalizationKey: String {
    
    // MARK: Search Screen
    case searchBarPlaceholder
    case cancelSearch
    
    // MARK: Product Details Screen
    case detailsTitle
    
    // MARK: Error Screen
    case invalidURL
    case NoData
    case serverError
    case unknownError
    case invalidURLMessage
    case NoDataMessage
    case serverErrorMessage
    case unknownErrorMessage
    case invalidURLImage
    case NoDataImage
    case serverErrorImage
    case unknownErrorImage
    
    public var key: String {
        rawValue
    }
}
