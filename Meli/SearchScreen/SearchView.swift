//
//  SearchView.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchView: UIView {
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        return containerView
    }()
    
//    lazy var searchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.setBarStyle()
//        return searchBar
//    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(self.containerView)
//        containerView.addSubview(searchBar)
    }
    
    func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
//            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
//            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
//            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8)
        ])
    }
}
