//
//  UIViewExtension.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, paddingTop: CGFloat? = nil,
                bottom: NSLayoutYAxisAnchor? = nil, paddingBottom: CGFloat? = nil,
                leading: NSLayoutXAxisAnchor? = nil, paddingLeading: CGFloat? = nil,
                trailing: NSLayoutXAxisAnchor? = nil, paddingTrailing: CGFloat? = nil,
                width: CGFloat? = nil, height: CGFloat? = nil)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop ?? 0).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: paddingBottom ?? 0).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading ?? 0).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: paddingTrailing ?? 0).isActive = true
        }
        
        if let width = width {
            if width != 0 {
                widthAnchor.constraint(equalToConstant: width).isActive = true
            }
        }
        
        if let height = height {
            if height != 0 {
                heightAnchor.constraint(equalToConstant: height).isActive = true
            }
        }
    }
    
    func center(centerX: NSLayoutXAxisAnchor? = nil, paddingX: CGFloat? = nil,
                centerY: NSLayoutYAxisAnchor? = nil, paddingY: CGFloat? = nil)
    {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingX ?? 0).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingY ?? 0).isActive = true
        }
    }
}
