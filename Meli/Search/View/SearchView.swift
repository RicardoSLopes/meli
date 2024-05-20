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

class SearchView: UIView, ViewCodeSetup {
    
    var viewModel: SearchViewModel
    let navigation: UINavigationController?
    let kHeightRow: CGFloat = 160
    weak var delegate: SearchViewDelegate?
    
    init(viewModel: SearchViewModel,
         navigation: UINavigationController?) {
        self.viewModel = viewModel
        self.navigation = navigation
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
    
    func setupView() {
        setObservers()
        setupTableView()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupTableView() {
        self.productTableView.dataSource = self
        self.productTableView.delegate = self
    }
    
    func setupHierarchy() {
        self.searchBar.delegate = self
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

    private func setObservers() {
        viewModel.$products.sink { [weak self] products in
            DispatchQueue.main.async {
                self?.productTableView.reloadData()
            }
        }.store(in: &viewModel.cancellable)
    }
}

// MARK: TableView Methods
extension SearchView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        
        let product = viewModel.products[indexPath.row]
        
        cell.setViewWith(product: product)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kHeightRow
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = viewModel.products[indexPath.row]
        delegate?.getProductDetails(from: product)
    }
}


// MARK: SearchBar Methods
extension SearchView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            viewModel.searchProducts(searchTerm: text)
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}
