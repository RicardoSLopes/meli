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
    private let searchBar = SearchBar()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view = searchView
            self.view.backgroundColor = .white
            
            searchBar.delegate = self
            navigationItem.titleView = searchBar

            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .yellow

            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    

        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            self.navigationController?.navigationBar.isHidden = false
        }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
           searchBar.showsCancelButton = true
       }

       func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
           searchBar.showsCancelButton = false
       }
       
       func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searchBar.showsCancelButton = false
           searchBar.text = ""
           searchBar.resignFirstResponder()
       }
}
