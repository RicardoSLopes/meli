//
//  ViewCodeSetup.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import Foundation

protocol ViewCodeSetup {
    func setupHierarchy()
    func setupConstraints()
    func setupView()
}
extension ViewCodeSetup {
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
}
