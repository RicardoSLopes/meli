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
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let productThumb: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    func setViewWith(product: Product) {
        setupView()
        
        self.priceLabel.text = product.price?.toCurrencyFormat()
        self.titleLabel.text = product.title
        self.productThumb.loadImageFrom(url: product.thumbnail ?? "")
    }

}

extension ProductTableViewCell: ViewCodeSetup {
    
    func setupHierarchy() {
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
