//
//  ProductTableViewCell.swift
//  Meli
//
//  Created by Ricardo Santana on 13/05/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    let productThumb: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setViewWith(product: Product) {
        setupView()
        
        self.titleLabel.text = product.title
        self.productThumb.loadImageFrom(url: product.thumbnail ?? "")
        self.priceLabel.text = product.price?.toCurrencyFormat()
    }
}

extension ProductTableViewCell: ViewCodeSetup {
    
    func setupHierarchy() {

        self.contentView.addSubview(productThumb)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(priceLabel)

    }
    
    func setupConstraints() {
        productThumb.anchor(
            top: self.topAnchor, paddingTop: 10,
            bottom: self.bottomAnchor, paddingBottom: 10,
            leading: self.leadingAnchor, paddingLeading: 16,
            width: 120, height: 120
        )
        
        titleLabel.anchor(
            top: productThumb.topAnchor,
            leading: productThumb.trailingAnchor, paddingLeading: 10,
            trailing: self.trailingAnchor, paddingTrailing: -16
        )
        
        priceLabel.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 10,
            leading: titleLabel.leadingAnchor, paddingLeading: 0,
            trailing: self.trailingAnchor, paddingTrailing: -16
        )
    }
}
