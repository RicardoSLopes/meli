//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var viewModel: SearchViewModel
    
    var searchView: SearchView {
        guard let unwrappedView = self.view as? SearchView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = SearchView(
            viewModel: viewModel,
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
    func showProductDetail(didSelectProduct product: Product) {
        coordinator?.showProductDetail(for: product)
    }
}


