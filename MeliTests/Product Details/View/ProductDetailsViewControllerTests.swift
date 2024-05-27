//
//  ProductDetailsViewControllerTests.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import XCTest

class ProductDetailsViewControllerTests: XCTestCase {

    var sut: ProductDetailsViewController!
    var mockViewModel: MockProductDetailsViewModel!

    override func setUp() {
        super.setUp()
        mockViewModel = MockProductDetailsViewModel(product: MockProduct.product1)
        sut = ProductDetailsViewController(viewModel: mockViewModel)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewController_whenViewDidLoad_shouldCallLoadProductDetails() {
        sut.viewDidLoad()
        
        XCTAssertTrue(mockViewModel.loadProductDetailsWasCalled)
    }

    func testViewController_viewDidLoad_SetsBackgroundColor() {
        sut.loadViewIfNeeded()
        sut.viewDidLoad()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
}
