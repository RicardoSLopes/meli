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
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.setBarStyle()
        searchBar.placeholder = "Buscar"
        return searchBar
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("Buscar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
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
        containerView.addSubview(searchBar)
        containerView.addSubview(searchButton)
    }
    
    func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            searchBar.trailingAnchor.constraint(equalTo: searchButton.leadingAnchor, constant: -4),
            searchBar.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            
            searchButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            searchButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
