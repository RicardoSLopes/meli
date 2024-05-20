//
//  ProductDetailView.swift
//  Meli
//
//  Created by Ricardo Santana on 15/05/24.
//

import UIKit

class ProductDetailView: UIView, ViewCodeSetup {
    
    var product: Product?
    var productDetails: String?
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.setupView()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var productDetailTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            ProductDetailTableViewCell.self,
            forCellReuseIdentifier: ProductDetailTableViewCell.identifier
        )
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private func setupTableView() {
        self.productDetailTableView.dataSource = self
        self.productDetailTableView.delegate = self
    }
    
    func setupHierarchy() {
        addSubview(productDetailTableView)
    }
    
    func setupConstraints() {
        productDetailTableView.translatesAutoresizingMaskIntoConstraints = false
        
        productDetailTableView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
    }
}

extension ProductDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailTableViewCell.identifier, for: indexPath) as? ProductDetailTableViewCell else { return UITableViewCell() }
        
        cell.setViewWith(product: product, productDetails: productDetails)
        cell.selectionStyle = .none
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }
}
