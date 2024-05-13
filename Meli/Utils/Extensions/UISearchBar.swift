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
        searchTextField()
        cancelButton()
//        searchTextField.backgroundColor = .white
//        layer.masksToBounds = true
//        searchTextField.layer.cornerRadius = 16
//        searchTextField.layer.masksToBounds = true
        
    }
    
    func searchTextField() {
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.font = UIFont.systemFont(ofSize: 14)
            textField.placeholder = LocalizationKey.searchBarPlaceholder.value()
            
            if let backgroundview = textField.subviews.first {
                backgroundview.layer.cornerRadius = 16
                backgroundview.clipsToBounds = true
            }
        }
    }
    
    func cancelButton() {
        self.showsCancelButton = true
        if let cancelButton = self.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(.black, for: .normal)
            cancelButton.setTitle(LocalizationKey.cancelSearch.value(), for: .normal)
        }
    }
}
