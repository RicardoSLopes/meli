//
//  ErrorViewController.swift
//  Meli
//
//  Created by Ricardo Santana on 18/05/24.
//

import UIKit
import os.log

class ErrorViewController: UIViewController {
    
    let error: Constants.UIError
    
    var errorView: ErrorView {
        guard let unwrappedView = self.view as? ErrorView else {
            Logger.shared.log("Failed to cast self.view as ErrorView", level: .error)
            fatalError("No View!")
        }
        return unwrappedView
    }
    
    init(error: Constants.UIError) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
        Logger.shared.log("ErrorViewController initialized with error: \(error)", level: .info)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSetup()
        Logger.shared.log("ErrorViewController did load.", level: .info)
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         navigationController?.setNavigationBarHidden(true, animated: animated)
         Logger.shared.log("ErrorViewController will appear, hiding navigation bar.", level: .info)
     }
    
    override func loadView() {
        self.view = ErrorView()
        errorView.delegate = self
        errorView.setViewWith(error: error)
        Logger.shared.log("ErrorView setup with error configuration.", level: .debug)
    }

    func viewSetup() {
        view.backgroundColor = .white
        Logger.shared.log("ErrorViewController view setup completed.", level: .debug)
    }
}

extension ErrorViewController: ErrorViewDelegate {
    func back() {
        dismiss(animated: true)
        Logger.shared.log("ErrorViewController dismissed via back button.", level: .info)
    }
}
