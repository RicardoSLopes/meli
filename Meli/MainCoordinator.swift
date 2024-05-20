//
//  MainCoordinator.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit
import os.log

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController = UINavigationController()
    let networkService: NetworkRequest = Network()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        Logger.shared.log("MainCoordinator initialized with a navigation controller.", level: .debug)
    }
    
    func splashScreen() {
        let splashViewController = SplashViewController()
        splashViewController.coordinator = self
        navigationController.pushViewController(splashViewController, animated: true)
    }
    
    func start() {
        Logger.shared.log("Starting MainCoordinator.", level: .info)
        let viewModel = SearchViewModel(network: networkService)
        let searchViewController = SearchViewController(viewModel: viewModel)
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: true)
        Logger.shared.log("SearchViewController pushed onto navigation stack.", level: .info)
    }
    
    func showProductDetails(for product: Product, productDetails: String) {
        Logger.shared.log("Preparing to show product details for product ID: \(product.id)", level: .info)
        let productDetailsViewController = ProductDetailsViewController()
        productDetailsViewController.coordinator = self
        productDetailsViewController.product = product
        productDetailsViewController.productDetails = productDetails
        navigationController.pushViewController(productDetailsViewController, animated: true)
        Logger.shared.log("ProductDetailsViewController pushed onto navigation stack.", level: .info)
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
