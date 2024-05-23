//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit
import os.log

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    weak var coordinator: MainCoordinator?
    var viewModel: SearchViewModel
//    var productDetailViewModel: ProductDetailsViewModel?
    let kHeightRow: CGFloat = 160
    
    var searchView: SearchView {
        guard let unwrappedView = self.view as? SearchView else {
            Logger.shared.log("View casting failed in SearchViewController", level: .error)
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        Logger.shared.log("SearchViewController initialized with SearchViewModel.", level: .debug)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.shared.log("SearchViewController view did load.", level: .info)
        searchView.searchBar.delegate = self
        // verificar o nome do outro metodo de observer
        setObserver()
        setupTableView()
        configureErrorHandling()
    }
    
    override func loadView() {
        self.view = SearchView(navigation: coordinator?.navigationController)
        searchView.delegate = self
        self.navigationItem.backButtonTitle = ""
        Logger.shared.log("SearchView set as main view in SearchViewController.", level: .info)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchSetup()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        Logger.shared.log("SearchViewController will appear.", level: .info)
    }
    
    private func searchSetup() {
        self.view.backgroundColor = .white
        navigationItem.titleView = searchView.searchBar
        navigationController?.setMeliAppearance()
        Logger.shared.log("Search setup completed.", level: .info)
    }
    
    private func setObserver() {
        viewModel.$products.sink { [weak self] products in
            DispatchQueue.main.async {
                guard let self = self else { return }
                self.searchView.productTableView.reloadData()
            }
        }.store(in: &viewModel.cancellable)
    }

    
    private func setupTableView() {
        searchView.productTableView.dataSource = self
        searchView.productTableView.delegate = self
    }
    
    private func configureErrorHandling() {
        viewModel.showError = { [weak self] error in
            Logger.shared.log("Error received: \(error)", level: .error)
            self?.coordinator?.showError(error)
        }
        
//        productDetailViewModel?.showError = { [weak self] error in
//            Logger.shared.log("Error received: \(error)", level: .error)
//            self?.coordinator?.showError(error)
//        }
    }
    // MARK: SearchBar Methods
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

extension SearchViewController: SearchViewDelegate {
        
    func getProductDetails(from product: Product) {
        Logger.shared.log("Attempting to get product details for product ID: \(product.id)", level: .info)
        guard let network = coordinator?.networkService else {
            Logger.shared.log("Network service not available.", level: .error)
            return
        }
//        productDetailViewModel = ProductDetailsViewModel(network: network)
//        productDetailViewModel?.getProductDetails(productID: product.id) { [weak self] details, error in
//            guard let self else { return }
//            DispatchQueue.main.async {
//                if let details = details {
//                    Logger.shared.log("Product details received: \(details.plainText)", level: .info)
//                    self.showProductDetails(didSelectProduct: product, productDetails: details.plainText)
//                } else if let error = error {
//                    Logger.shared.log("Error fetching product details: \(error.localizedDescription)", level: .error)
//                    self.showError(error)
//                }
//            }
//        }
    }
    
    func showProductDetails(didSelectProduct product: Product, productDetails: String) {
        Logger.shared.log("Showing product details for product ID: \(product.id)", level: .info)
        coordinator?.showProductDetails(for: product)
    }
    
//    private func showError(_ error: Error) {
//        Logger.shared.log("Error in SearchViewController: \(error.localizedDescription)", level: .error)
//    }
}


// MARK: TableView Methods
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        coordinator?.showProductDetails(for: product)
//        delegate?.getProductDetails(from: product)
    }
}
