//
//  SearchView.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchView: UIView {
    
    var viewModel: SearchViewModel?
    
    private let productTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(
            ProductTableViewCell.self,
            forCellReuseIdentifier: ProductTableViewCell.identifier
        )
        return tableView
    }()
       
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.setBarStyle()
        return searchBar
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
        setObservers()
    }
    
    func setupHierarchy() {
        
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
        self.searchBar.delegate = self
        
        self.addSubview(productTableView)
    }
    
    func setupConstraints() {
        productTableView.translatesAutoresizingMaskIntoConstraints = false
        
        productTableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            left: self.leadingAnchor,
            right: self.trailingAnchor
        )
    
    }
    
    func setObservers() {
        if let viewModel = viewModel {
            viewModel.$products.sink { [weak self] products in
                self?.productTableView.reloadData()
            }.store(in: &viewModel.cancellable)
        }
    }
}

// MARK: TableView Methods
extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        guard let product = viewModel?.products[indexPath.row]
        else { return UITableViewCell() }
        
        cell.setViewWith(product: product)
        
        return cell
    }
    
}


// MARK: SearchBar Methods
extension SearchView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            viewModel?.searchProducts(searchTerm: text)
        }
    }
}
