//
//  SearchViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = SearchView()
            self.view.backgroundColor = .yellow
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = true
        }
    
    func SearchButtonTapped() {
        // coordinator?
    }
}
