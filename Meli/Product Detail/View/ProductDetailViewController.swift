//
//  ProductDetailViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 14/05/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    var product: Product?
    var productDetails: String?
    
    var productDetailView: ProductDetailView {
        guard let unwrappedView = self.view as? ProductDetailView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    override func loadView() {
        self.view = ProductDetailView()
        productDetailView.product = product
        productDetailView.productDetails = productDetails
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
    func viewSetup() {
        view.backgroundColor = .white
    }
}
