//
//  ProductTableViewCell.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let productThumb: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        imageView.layer.shadowRadius = 2
        imageView.layer.shadowOffset = .zero
        
        return imageView
    }()
    
    func setViewWith(product: Product) {
        setupViews()
        
        self.priceLabel.text = product.price?.toCurrencyFormat()
        self.titleLabel.text = product.title
        self.productThumb.loadImageFrom(url: product.thumbnail ?? "")
    }

}

extension ProductTableViewCell: ViewCodeSetup {
    
    func setViewHierarchy() {
        productThumb.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(productThumb)
        self.contentView.addSubview(priceLabel)
        self.contentView.addSubview(titleLabel)

    }
    
    func setupConstraints() {
        productThumb.anchor(
            top: self.topAnchor, paddingTop: 10,
            bottom: self.bottomAnchor, paddingBottom: 10,
            left: self.leftAnchor, paddingLeft: 0,
            width: 40, height: 40
        )
    }
}
