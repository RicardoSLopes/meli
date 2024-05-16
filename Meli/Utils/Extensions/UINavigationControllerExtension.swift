//
//  UINavigationControllerExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 12/05/24.
//

import UIKit

extension UINavigationController {
    
    func setMeliAppearance() {
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .yellow

        let scrollEdgeAppearance = UINavigationBarAppearance()
        scrollEdgeAppearance.backgroundColor = .yellow

        self.navigationBar.standardAppearance = standardAppearance

        if #available(iOS 15.0, *) {
            self.navigationBar.scrollEdgeAppearance = scrollEdgeAppearance
        }
    }
}

