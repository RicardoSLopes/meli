//
//  ProductDetailsViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 14/05/24.
//

import UIKit
import os.log
import Combine

class ProductDetailsViewController: UIViewController, UISearchBarDelegate {
    
    weak var coordinator: MainCoordinator?
    private var viewModel: ProductDetailsViewModel
    private var cancellable = Set<AnyCancellable>()
    //    let product: Product
    //    var productDetails: String?
    
    var productDetailView: ProductDetailView {
        guard let unwrappedView = self.view as? ProductDetailView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(viewModel: ProductDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productDetailView.searchBar.delegate = self
        loadProductDetails()
        setupTableView()
        configureErrorHandling()
        Logger.shared.log("ProductDetailsViewController did load.", level: .info)
    }
    
    override func loadView() {
        super.loadView()
        Logger.shared.log("Loading Product Detail View.", level: .info)
        self.view = ProductDetailView(product: viewModel.product, productDetails: viewModel.productDetails ?? LocalizationKey.noProductDetails.value())
        //        productDetailView.product = product
        //
        //        if product == nil || productDetails == nil {
        //            Logger.shared.log("Product or product details not set.", level: .error)
        //        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchSetup()
        self.navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        Logger.shared.log("ProductDetailsController will appear.", level: .info)
    }
    
    private func searchSetup() {
        self.view.backgroundColor = .white
        navigationItem.titleView = productDetailView.searchBar
        navigationController?.setMeliAppearance()
        Logger.shared.log("Search setup completed.", level: .info)
    }
    
    private func loadProductDetails() {
        print("init loadProductDetails\(cancellable.count)")
        viewModel.$productDetails
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] productDetail in
                guard let self = self else { return }
            })
            .store(in: &cancellable)
        print("end loadProductDetails\(cancellable.count)")
        
        viewModel.loadProductDetails(productID: viewModel.product.id) { [weak self] productDetails in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.updateView(with: productDetails)
            }
        }
    }
    
    private func configureErrorHandling() {
        viewModel.showError = { [weak self] error in
            Logger.shared.log("Error received: \(error)", level: .error)
            self?.coordinator?.showError(error)
        }
    }
    
  
    
    private func updateView(with productDetails: String) {
        productDetailView.update(with: productDetails)
    }
    
    // MARK: SearchBar Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            // !!! Criar logica para voltar tela
            // e fazer busca pelo termo
            
            coordinator?.back(with: text)
//            viewModel.searchProducts(searchTerm: text)
            searchBar.resignFirstResponder()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
}

extension ProductDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as? ProductDetailTableViewCell else { return UITableViewCell() }
        
        cell.setViewWith(product: productDetailView.product, productDetails: productDetailView.productDetails)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
    
    
    private func setupTableView() {
        productDetailView.productDetailTableView.dataSource = self
        productDetailView.productDetailTableView.delegate = self
    }
}
