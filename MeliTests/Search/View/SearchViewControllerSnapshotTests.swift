//
//  SearchViewControllerSnapshotTests.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import XCTest
import SnapshotTesting

class SearchViewControllerSnapshotTests: XCTestCase {
    
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func testSearchViewController_DefaultState() {
        let sut = makeSUT()
        window.rootViewController = sut
        window.makeKeyAndVisible()
        assertSnapshot(matching: sut, as: .image)
    }
    
    func testSearchViewController_WithData() {
        let sut = makeSUT()
        sut.viewModel.products = [Product(id: "1", title: "Test Product", price: 10.0, thumbnail: "URL")]
        sut.view.layoutIfNeeded()
        assertSnapshot(matching: sut, as: .image(on: .iPhone8))
    }
    
    func testSearchViewController_WithError() {
        let sut = makeSUT()
        sut.viewModel.showError?(.invalidURL)
        sut.view.layoutIfNeeded()
        assertSnapshot(matching: sut, as: .image(on: .iPhone8))
    }
    
    private func makeSUT() -> SearchViewController {
        let mockNetwork = MockNetwork()
        let mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        let mockSearchViewModel = MockSearchViewModel(network: mockNetwork)
        let sut = SearchViewController(viewModel: mockSearchViewModel)
        sut.coordinator = mockCoordinator
        sut.loadViewIfNeeded()
        return sut
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
}

