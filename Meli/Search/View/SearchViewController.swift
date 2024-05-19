//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit
import os.log

class SearchViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var searchViewModel: SearchViewModel
    var productDetailViewModel: ProductDetailsViewModel?
    
    var searchView: SearchView {
        guard let unwrappedView = self.view as? SearchView else {
            Logger.shared.log("View casting failed in SearchViewController", level: .error)
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: SearchViewModel) {
        self.searchViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        Logger.shared.log("SearchViewController initialized with SearchViewModel.", level: .debug)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.shared.log("SearchViewController view did load.", level: .info)
        
        searchViewModel.showError = { [weak self] error in
            Logger.shared.log("Error received: \(error)", level: .error)
            self?.coordinator?.showError(error)
        }
        
        productDetailViewModel?.showError = { [weak self] error in
            Logger.shared.log("Error received: \(error)", level: .error)
            self?.coordinator?.showError(error)
        }
    }
    
    override func loadView() {
        self.view = SearchView(
            viewModel: searchViewModel,
            navigation: coordinator?.navigationController
        )
        searchView.delegate = self
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
        Logger.shared.log("SearchView set as main view in SearchViewController.", level: .info)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchSetup()
        self.navigationController?.navigationBar.isHidden = false
        Logger.shared.log("SearchViewController will appear.", level: .info)
    }
    
    func searchSetup() {
        self.view.backgroundColor = .white
        navigationItem.titleView = searchView.searchBar
        navigationController?.setMeliAppearance()
        Logger.shared.log("Search setup completed.", level: .info)
    }
}

extension SearchViewController: SearchViewDelegate {
        
    func getProductDetails(from product: Product) {
        Logger.shared.log("Attempting to get product details for product ID: \(product.id)", level: .info)
        guard let network = coordinator?.networkService else {
            Logger.shared.log("Network service not available.", level: .error)
            return
        }
        productDetailViewModel = ProductDetailsViewModel(network: network)
        productDetailViewModel?.getProductDetails(productID: product.id) { [weak self] details, error in
            guard let self else { return }
            DispatchQueue.main.async {
                if let details = details {
                    Logger.shared.log("Product details received: \(details.plainText)", level: .info)
                    self.showProductDetails(didSelectProduct: product, productDetails: details.plainText)
                } else if let error = error {
                    Logger.shared.log("Error fetching product details: \(error.localizedDescription)", level: .error)
                    self.showError(error)
                }
            }
        }
    }
    
    func showProductDetails(didSelectProduct product: Product, productDetails: String) {
        Logger.shared.log("Showing product details for product ID: \(product.id)", level: .info)
        coordinator?.showProductDetails(for: product, productDetails: productDetails)
    }
    
    private func showError(_ error: Error) {
        Logger.shared.log("Error in SearchViewController: \(error.localizedDescription)", level: .error)
        // Handle error by showing alert or error message
    }
}
