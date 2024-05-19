//
//  ProductDetailViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 14/05/24.
//

import UIKit
import os.log

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
        super.loadView()
        Logger.shared.log("Loading Product Detail View.", level: .info)
        self.view = ProductDetailView()
        productDetailView.product = product
        productDetailView.productDetails = productDetails
        
        if product == nil || productDetails == nil {
            Logger.shared.log("Product or product details not set.", level: .error)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.shared.log("ProductDetailViewController did load.", level: .info)
        viewSetup()
    }
    
    func viewSetup() {
        view.backgroundColor = .white
        Logger.shared.log("ProductDetailView is setup with background color white.", level: .debug)
    }
}

