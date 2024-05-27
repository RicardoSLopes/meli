//
//  SearchView.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

protocol SearchViewDelegate: AnyObject {
    func getProductDetails(from product: Product)
}

class SearchView: UIView {
    
    let navigation: UINavigationController?
    weak var delegate: SearchViewDelegate?
    
    init(navigation: UINavigationController?) {
        self.navigation = navigation
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let productTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(
            ProductTableViewCell.self,
            forCellReuseIdentifier: ProductTableViewCell.identifier
        )
        return tableView
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = SearchBar()
        return searchBar
    }()

}

extension SearchView: ViewCodeSetup {
    
    func setupHierarchy() {
        self.addSubview(productTableView)
    }
    
    func setupConstraints() {
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        productTableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
    }
}
