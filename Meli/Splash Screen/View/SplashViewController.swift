//
//  SplashViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 19/05/24.
//

import UIKit

class SplashViewController: UIViewController {

    weak var coordinator: MainCoordinator?

    private var splashView: SplashView = SplashView()

    init() {
        splashView = SplashView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.splashView
        self.navigationItem.backButtonTitle = ""
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        startAnimation()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        stopAnimation()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAnimation() {
        UIView.animate(withDuration: 3.0, animations: {
            self.splashView.containerView.alpha = 1.0
        }) { (_) in
            UIView.animate(withDuration: 3.0, animations: {
                self.splashView.containerView.alpha = 0.0
            })
            { (_) in
                self.coordinator?.start()
            }
        }
    }
    
    func stopAnimation() {
        splashView.removeFromSuperview()
    }

}

