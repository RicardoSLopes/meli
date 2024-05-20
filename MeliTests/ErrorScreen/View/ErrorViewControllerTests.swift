//
//  ErrorViewControllerTests.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import XCTest

class ErrorViewControllerTests: XCTestCase {
    
    func testErrorScreen_WhenErrorIsinvalidURL_ShouldShowInvalidURLInfo() {
        let error = Constants.UIError.invalidURL
        let sut = makeSUT(error: error)
        
        XCTAssertEqual(sut.error, error)
    }
    
    func testErrorScreen_WhenErrorIsNoDataL_ShouldShowNoDataInfo() {
        let error = Constants.UIError.noData
        let sut = makeSUT(error: error)
        
        XCTAssertEqual(sut.error, error)
    }
    
    func testErrorScreen_WhenErrorIsServerError_ShouldShowServerErrorInfo() {
        let error = Constants.UIError.serverError
        let sut = makeSUT(error: error)
        
        XCTAssertEqual(sut.error, error)
    }
    
    func testErrorScreen_WhenErrorIsUnknown_ShouldShowUnknownInfo() {
        let error = Constants.UIError.unknown
        let sut = makeSUT(error: error)
        
        XCTAssertEqual(sut.error, error)
    }
    
    func testErrorScreen_WhenCallViewDidLoad() {
        let sut = makeSUT()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
    
    func testErrorScreen_WhenCallViewWillAppear_HidesNavigationBar() {
        let sut = makeSUT()
        let navigationController = UINavigationController(rootViewController: sut)
       
        // Before Call viewWillAppear
        XCTAssertFalse(navigationController.isNavigationBarHidden)
        sut.viewWillAppear(true)
        
        XCTAssertTrue(navigationController.isNavigationBarHidden)
    }
    
    func testErrorScreen_WhenCloseButtonTapped_ShouldDismissScreen() {
        var mockDelegate = MockErrorViewDelegate()
        let sut = makeSUT()
        let errorView = ErrorView()
        errorView.delegate = mockDelegate
        sut.view = errorView
    
        sut.errorView.closeButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(mockDelegate.closeCalled)
    }
    
    func makeSUT(error: Constants.UIError = .invalidURL) -> ErrorViewController {
         ErrorViewController(error: error)
    }
}
