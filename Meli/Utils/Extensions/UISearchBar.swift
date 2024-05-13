//
//  UISearchBar.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

extension UISearchBar {
    
    func setBarStyle()  {
        searchBarStyle = .minimal
        searchTextField.backgroundColor = .white
        layer.masksToBounds = true
        searchTextField.layer.cornerRadius = 16
        searchTextField.layer.masksToBounds = true
        placeholder = LocalizationKey.searchBarPlaceholder.value()
    }
}
