//
//  ErrorViewControllerSnapshotTests.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import XCTest
import SnapshotTesting

class ErrorViewControllerSnapshotTests: XCTestCase {

    func testErrorViewControllerWithInvalidURLError() {
        let sut = makeSUT(error: .invalidURL)
        assertSnapshot(matching: sut, as: .image)
    }

    func testErrorViewControllerWithNoDataError() {
        let sut = makeSUT(error: .noData)
        assertSnapshot(matching: sut, as: .image)
    }

    func testErrorViewControllerWithServerError() {
        let sut = makeSUT(error: .serverError)
        assertSnapshot(matching: sut, as: .image)
    }

    func testErrorViewControllerWithUnknownError() {
        let sut = makeSUT(error: .unknown)
        assertSnapshot(matching: sut, as: .image)
    }

    private func makeSUT(error: Constants.UIError) -> ErrorViewController {
        let viewController = ErrorViewController(error: error)
        viewController.loadViewIfNeeded()
        return viewController
    }
}

