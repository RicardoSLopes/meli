//
//  ProductDetailTableViewCell.swift
//  Meli
//
//  Created by Ricardo Santana on 14/05/24.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    let backgroundContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productThumb: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let detailsTitle: UILabel = {
        let label = UILabel()
        label.text = LocalizationKey.detailsTitle.value()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productDetails: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setViewWith(product: Product?, productDetails: String) {
        setupView()
        self.priceLabel.text = product?.price?.toCurrencyFormat()
        self.titleLabel.text = product?.title
        self.productThumb.loadImageFrom(url: product?.thumbnail ?? "")
        self.productDetails.text = productDetails
    }
}

extension ProductDetailTableViewCell: ViewCodeSetup {
    
    func setupHierarchy() {
        
        self.contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(titleLabel)
        backgroundContainer.addSubview(productThumb)
        backgroundContainer.addSubview(priceLabel)
        backgroundContainer.addSubview(detailsTitle)
        backgroundContainer.addSubview(productDetails)
    }
    
    func setupConstraints() {
        
        backgroundContainer.anchor(
            top: contentView.topAnchor,
            bottom: contentView.bottomAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor
        )
        
        titleLabel.anchor(
            top: backgroundContainer.topAnchor, paddingTop: 16,
            leading: backgroundContainer.leadingAnchor, paddingLeading: 8,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16
        )
        
        productThumb.anchor(
            top: titleLabel.bottomAnchor, paddingTop: 8,
            leading: backgroundContainer.leadingAnchor, paddingLeading: 16,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16,
            height: 320
        )
        
        priceLabel.anchor(
            top: productThumb.bottomAnchor, paddingTop: 32,
            leading: titleLabel.leadingAnchor,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16
        )
        
        detailsTitle.anchor(
            top: priceLabel.bottomAnchor, paddingTop: 16,
            leading: titleLabel.leadingAnchor,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16
        )
        
        productDetails.anchor(
            top: detailsTitle.bottomAnchor, paddingTop: 16,
            bottom: backgroundContainer.bottomAnchor, paddingBottom: -16,
            leading: titleLabel.leadingAnchor,
            trailing: titleLabel.trailingAnchor
        )
    }
}
