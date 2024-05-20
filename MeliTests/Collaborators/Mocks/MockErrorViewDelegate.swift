//
//  MockErrorViewDelegate.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli

class MockErrorViewDelegate: ErrorViewDelegate {
    var closeCalled = false

    func close() {
        closeCalled = true
    }
}
