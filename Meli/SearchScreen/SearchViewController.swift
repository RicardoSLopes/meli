//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    private let searchView = SearchView()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = searchView
            self.view.backgroundColor = .white
            navigationItem.titleView = searchView.searchBar

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .yellow

            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    

        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = false
        }
    
    func SearchButtonTapped() {
        // coordinator?
    }
}
