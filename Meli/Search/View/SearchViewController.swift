//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var searchViewModel: SearchViewModel
    var productDetailViewModel: ProductDetailViewModel?
    
    var searchView: SearchView {
        guard let unwrappedView = self.view as? SearchView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: SearchViewModel) {
        self.searchViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SearchView(
            viewModel: searchViewModel,
            navigation: coordinator?.navigationController
        )
        searchView.delegate = self
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchSetup()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func searchSetup() {
        self.view.backgroundColor = .white
        navigationItem.titleView = searchView.searchBar
        navigationController?.setMeliAppearance()
    }
}

extension SearchViewController: SearchViewDelegate {
        
    func getProductDetails(from product: Product) {
        guard let network = coordinator?.networkService else { return }
        productDetailViewModel = ProductDetailViewModel(network: network)
        productDetailViewModel?.getProductDetails(productID: product.id) { [weak self] details, error in
            guard let self else { return }
            DispatchQueue.main.async {
                if let details = details {
                    self.showProductDetails(didSelectProduct: product, productDetails:  details.plainText)
                } else if let error = error {
                    self.showError(error)
                }
            }
        }
    }
    
    func showProductDetails(didSelectProduct product: Product, productDetails: String) {
        coordinator?.showProductDetails(for: product, productDetails: productDetails)
    }
    
    private func showError(_ error: Error) {
        // !!! Handle error by showing alert or error message
    }
}


