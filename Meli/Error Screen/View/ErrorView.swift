//
//  ErrorView.swift
//  Meli
//
//  Created by Ricardo Santana on 18/05/24.
//

import UIKit

protocol ErrorViewDelegate: AnyObject {
    func back()
}

class ErrorView: UIView {
    
    weak var delegate: ErrorViewDelegate?
    
    lazy var backgroundContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setCloseButtonStyle()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var messageError: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setViewWith(error: Constants.UIError) {
        setupView()
        self.imageView.image = UIImage(named: error.imageName)
        self.messageError.text = error.message
    }
    
    @objc func closeButtonTapped() {
        delegate?.back()
    }
}

extension ErrorView: ViewCodeSetup {
    func setupHierarchy() {
        addSubview(backgroundContainer)
        backgroundContainer.addSubview(closeButton)
        backgroundContainer.addSubview(imageView)
        backgroundContainer.addSubview(messageError)
    }
    
    func setupConstraints() {
        backgroundContainer.anchor(
            top: self.safeAreaLayoutGuide.topAnchor,
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            leading: self.leadingAnchor,
            trailing: self.trailingAnchor
        )
        
        closeButton.anchor(
            top: backgroundContainer.topAnchor,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -16,
            width: 32, height: 32
        )
        
        imageView.anchor(
            top: backgroundContainer.topAnchor, paddingTop: 64,
            leading: backgroundContainer.leadingAnchor, paddingLeading: 32,
            trailing: backgroundContainer.trailingAnchor, paddingTrailing: -32,
            height: 320
        )
        
        messageError.anchor(
            top: imageView.bottomAnchor, paddingTop: 64,
            leading: imageView.leadingAnchor,
            trailing: imageView.trailingAnchor
        )
    }
}
