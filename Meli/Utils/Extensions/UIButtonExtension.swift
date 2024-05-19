//
//  UIButtonExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 19/05/24.
//

import UIKit

extension UIButton {
    
    func setCloseButtonStyle() {
        
        if let image = UIImage(systemName: "xmark") {
            self.setImage(image, for: .normal)
        }
        self.tintColor = .yellow
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 1
        self.layer.shadowOpacity = 1
    }
}
