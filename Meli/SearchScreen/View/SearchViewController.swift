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
        self.view = SearchView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func searchSetup() {
        self.view = searchView
        self.view.backgroundColor = .white
        navigationItem.titleView = searchView.searchBar
        navigationController?.setMeliAppearance()
        searchView.viewModel = viewModel
    }
}



