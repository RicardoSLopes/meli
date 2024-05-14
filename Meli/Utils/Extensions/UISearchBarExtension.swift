//
//  UISearchBar.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

extension UISearchBar {
    
    func setBarStyle() {
        searchBarStyle = .minimal
        delegate = self
        configureSearchTextField()
        configureCancelButton()
    }
    
    private func configureSearchTextField() {
        if #available(iOS 13.0, *) {
            let textField = self.searchTextField
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.font = UIFont.systemFont(ofSize: 14)
            textField.placeholder = LocalizationKey.searchBarPlaceholder.value()
            
            textField.layer.cornerRadius = 18
            textField.layer.masksToBounds = true
        } else {
            if let textField = self.value(forKey: "searchField") as? UITextField {
                textField.backgroundColor = .white
                textField.textColor = .black
                textField.font = UIFont.systemFont(ofSize: 14)
                textField.placeholder = LocalizationKey.searchBarPlaceholder.value()
                
                if let backgroundView = textField.subviews.first {
                    backgroundView.layer.cornerRadius = 18
                    backgroundView.clipsToBounds = true
                }
            }
        }
    }
    
    private func configureCancelButton() {
        self.showsCancelButton = true
        if let cancelButton = self.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitleColor(.black, for: .normal)
            cancelButton.setTitle(LocalizationKey.cancelSearch.value(), for: .normal)
        }
    }
}

extension UISearchBar: UISearchBarDelegate {
    
    public func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.configureCancelButton()
    }
    
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
    }
    
    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.delegate = self
        searchBar.showsCancelButton = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}


