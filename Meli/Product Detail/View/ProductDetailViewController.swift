//
//  ProductDetailViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 14/05/24.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var product: Product?
    
    let text: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let producDetailTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(
            ProductDetailTableViewCell.self,
            forCellReuseIdentifier: ProductDetailTableViewCell.identifier
        )
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       setupViews()
        viewSetup()
    }
    
    func viewSetup() {
        view.backgroundColor = .white
    }

}

extension ProductDetailViewController: ViewCodeSetup {
    func setViewHierarchy() {
        self.view.addSubview(text)
        text.text = product?.title
    }
    
    func setupConstraints() {
        text.translatesAutoresizingMaskIntoConstraints = false
        text.center(centerX: self.view.centerXAnchor, centerY: self.view.centerYAnchor)
    }
    
    
}
