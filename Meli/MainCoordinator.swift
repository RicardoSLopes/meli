//
//  MainCoordinator.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController = UINavigationController()
    let networkService: NetworkRequest = Network()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SearchViewModel(network: networkService)
        let searchViewController = SearchViewController(viewModel: viewModel)
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: true)
    }
    
    func showProductDetails(for product: Product, productDetails: String) {
        let productDetailViewController = ProductDetailViewController()
        productDetailViewController.coordinator = self
        productDetailViewController.product = product
        productDetailViewController.productDetails = productDetails
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}
