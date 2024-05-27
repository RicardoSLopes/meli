//
//  MainCoordinator.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit
import os.log

class MainCoordinator: Coordinator {
    var navigationController = UINavigationController()
    let networkService: NetworkRequest = Network()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        Logger.shared.log("MainCoordinator initialized with a navigation controller.", level: .debug)
    }
    
    func splashScreen() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = self
        navigationController.pushViewController(splashViewController, animated: false)
    }
    
    func start() {
        Logger.shared.log("Starting MainCoordinator.", level: .info)
        let searchViewModel = SearchViewModel(network: networkService)
        let searchViewController = SearchViewController(viewModel: searchViewModel)
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: false)
        Logger.shared.log("SearchViewController pushed onto navigation stack.", level: .info)
    }
    
    func showProductDetails(for product: Product) {
        Logger.shared.log("Preparing to show product details for product ID: \(product.id)", level: .info)
        let productDetaislViewModel = ProductDetailsViewModel(product: product, network: networkService)
        let productDetailsViewController = ProductDetailsViewController(viewModel: productDetaislViewModel)
        productDetailsViewController.coordinator = self
        navigationController.pushViewController(productDetailsViewController, animated: true)
        Logger.shared.log("ProductDetailsViewController pushed onto navigation stack.", level: .info)
    }
    
    func back(with searchTerm: String) {
        Logger.shared.log("Presenting previous view", level: .error)
        self.navigationController.popViewController(animated: true)
        configureSearchBar(searchTerm: searchTerm)
    }
    
    func showError(_ error: Constants.UIError) {
        Logger.shared.log("Presenting error view for error type: \(error)", level: .error)
        DispatchQueue.main.async {
            let errorViewController = ErrorViewController(error: error)
            errorViewController.modalPresentationStyle = .overFullScreen
            errorViewController.modalTransitionStyle = .crossDissolve
            self.navigationController.present(errorViewController, animated: true, completion: nil)
            Logger.shared.log("ErrorViewController presented modally.", level: .info)
        }
    }
}

extension MainCoordinator {
    private func configureSearchBar(searchTerm: String) {
        Logger.shared.log("Configuring searchBar when back to the SeachBar Screen", level: .error)
        if let viewController = self.navigationController.viewControllers.last as? SearchViewController {
            viewController.viewModel.products.removeAll()
            viewController.searchView.productTableView.reloadData()
            viewController.searchView.searchBar.text = searchTerm
            viewController.searchView.searchBar.placeholder = LocalizationKey.searchBarPlaceholder.value()
            viewController.searchBarSearchButtonClicked(viewController.searchView.searchBar)
        }
    }
}
