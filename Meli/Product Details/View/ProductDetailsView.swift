//
//  ProductDetailView.swift
//  Meli
//
//  Created by Ricardo Santana on 15/05/24.
//

import UIKit

class ProductDetailView: UIView {
    
    var product: Product
    var productDetails: String
    
    init(product: Product, productDetails: String) {
        self.product = product
        self.productDetails = productDetails
        super.init(frame: .zero)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.setBarStyle()
        return searchBar
    }()
    
    var productDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            ProductDetailTableViewCell.self,
            forCellReuseIdentifier: ProductDetailTableViewCell.identifier
        )
        tableView.separatorStyle = .none
        return tableView
    }()
    
    func update(with productDetails: String) {
        self.productDetails = productDetails
        self.productDetailTableView.reloadData()
    }
}

extension ProductDetailView:  ViewCodeSetup {
    func setupHierarchy() {
        addSubview(productDetailTableView)
    }
    
    func setupConstraints() {
        productDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        
        productDetailTableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
    }
}
