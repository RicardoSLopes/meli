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
        return view
    }()
    
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
    
    func setViewWith(product: Product?) {
        setupView()
        self.priceLabel.text = product?.price?.toCurrencyFormat()
        self.titleLabel.text = product?.title
        self.productThumb.loadImageFrom(url: product?.thumbnail ?? "")
    }
}

extension ProductDetailTableViewCell: ViewCodeSetup {
    
    func setupHierarchy() {
        
        self.contentView.addSubview(backgroundContainer)
        backgroundContainer.addSubview(titleLabel)
        backgroundContainer.addSubview(productThumb)
        backgroundContainer.addSubview(priceLabel)
    }
    
    func setupConstraints() {
        backgroundContainer.translatesAutoresizingMaskIntoConstraints = false
        productThumb.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundContainer.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
        
        
        titleLabel.anchor(
            top: backgroundContainer.topAnchor,
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
            bottom: backgroundContainer.bottomAnchor,
            leading: titleLabel.leadingAnchor,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16
        )
    }
}
