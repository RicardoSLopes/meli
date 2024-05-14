//
//  UINavigationControllerExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 12/05/24.
//

import UIKit

extension UINavigationController {
    
    func setMeliAppearance() {
       
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .yellow

        self.navigationBar.scrollEdgeAppearance = appearance
    }
}
