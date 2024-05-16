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
    
    var productDetailView: ProductDetailView {
        guard let unwrappedView = self.view as? ProductDetailView else {
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    override func loadView() {
        self.view = ProductDetailView()
        productDetailView.product = product
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
    }
    
    func viewSetup() {
        view.backgroundColor = .white
    }
    
}

//extension ProductDetailViewController: ViewCodeSetup {
//    func setViewHierarchy() {
//        self.view.addSubview(text)
//        text.text = product?.title
//    }
//    
//    func setupConstraints() {
//        text.translatesAutoresizingMaskIntoConstraints = false
//        text.center(centerX: self.view.centerXAnchor, centerY: self.view.centerYAnchor)
//    }
//}
