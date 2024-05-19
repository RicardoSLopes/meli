//
//  Coordinator.swift
//  Meli
//
//  Created by Ricardo Santana on 11/05/24.
//

import UIKit

protocol Coordinator {
   var navigationController: UINavigationController { get set }
   
   func start()
}
