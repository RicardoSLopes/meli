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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SearchViewModel(network: Network())
        let searchViewController = SearchViewController(viewModel: viewModel)
        searchViewController.coordinator = self
        navigationController.pushViewController(searchViewController, animated: true)
    }
}
