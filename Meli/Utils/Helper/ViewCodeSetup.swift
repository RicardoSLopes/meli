//
//  ViewCodeSetup.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

protocol ViewCodeSetup {
    func setViewHierarchy()
    func setupConstraints()
    func setupViews()
}
extension ViewCodeSetup {
    
    func setupViews() {
        setViewHierarchy()
        setupConstraints()
    }
}
