//
//  SplashView.swift
//  Meli
//
//  Created by Ricardo Santana on 19/05/24.
//

import UIKit

class SplashView: UIView {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "splash_icon")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor(named: "yellow")
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension SplashView: ViewCodeSetup {
    
    func setupView() {
        setupHierarchy()
       setupConstraints()
    }
    
    func setupHierarchy() {
        self.addSubview(self.containerView)
        self.containerView.addSubview(self.logoImageView)
    }

    func setupConstraints() {
        
        containerView.anchor(
            top: self.topAnchor,
            bottom: self.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
        
        logoImageView.anchor(
            height: 120
        )
        
        logoImageView.center(
            centerX: containerView.centerXAnchor,
            centerY: containerView.centerYAnchor
        )
    }
}
