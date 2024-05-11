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
        roundCorners(radius: 20)
    }
    
    func roundCorners(radius: CGFloat) {
        if let textField = self.value(forKey: "searchField") as? UITextField {
            textField.layer.cornerRadius = radius
            textField.clipsToBounds = true
        }
    }
    
    func setTextFieldHeight(_ height: CGFloat) {
        guard let textField = self.value(forKey: "searchField") as? UITextField else { return }
        textField.frame.size.height = height
    }
}
