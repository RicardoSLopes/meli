//
//  MockCoordinator.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import UIKit

class MockCoordinator: MainCoordinator {
    var showErroWasCalled = false
    var lastError: Constants.UIError = .serverError
    
    override func showError(_ error: Constants.UIError) {
        showErroWasCalled = true
        self.lastError = error
    }
        
}
