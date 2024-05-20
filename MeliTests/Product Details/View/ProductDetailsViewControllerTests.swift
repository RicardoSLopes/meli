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

    override func setUp() {
        super.setUp()
      
        sut = ProductDetailsViewController()
        sut.product = Product(id: "1", title: "Test Product", price: 100.0, thumbnail: "test_url")
        sut.productDetails = "Detailed information about the product."
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testViewController_loadView_SetsProductDetails() {
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(sut.productDetailView.product, sut.product)
        XCTAssertEqual(sut.productDetailView.productDetails, sut.productDetails)
    }

    func testViewController_viewDidLoad_SetsBackgroundColor() {
        sut.loadViewIfNeeded()
        sut.viewDidLoad()
        
        XCTAssertEqual(sut.view.backgroundColor, .white)
    }
}
