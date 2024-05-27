//
//  SearchViewControllerTests.swift
//  MeliTests
//
//  Created by Ricardo Santana on 19/05/24.
//

@testable import Meli
import XCTest

class SearchViewControllerTests: XCTestCase {
  
    func testSearchViewController_Initializer() {
        let mockNetwork = MockNetwork()
        let mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        let mockSearchViewModel = MockSearchViewModel(network: mockNetwork)
        let sut = makeSUT(coordinator: mockCoordinator, viewModel: mockSearchViewModel)
        
        XCTAssertNotNil(sut.viewModel)
    }
    
    func testViewDidLoad_ShouldConfigureErrorHandling() {
        let mockNetwork = MockNetwork()
        let mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        let mockSearchViewModel = MockSearchViewModel(network: mockNetwork)
        let sut = makeSUT(coordinator: mockCoordinator, viewModel: mockSearchViewModel)

        sut.viewDidLoad()

        XCTAssertTrue(sut.viewModel.showError != nil)
    }
    
    func testLoadView_ShouldSetupSearchView() {
        let mockNetwork = MockNetwork()
        let mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        let mockSearchViewModel = MockSearchViewModel(network: mockNetwork)
        let sut = makeSUT(coordinator: mockCoordinator, viewModel: mockSearchViewModel)
        
        sut.loadView()
        
        XCTAssertNotNil(sut.view as? SearchView)
    }
    
    func testSearchScreen_WhenCallViewWillAppear_HidesNavigationBar() {
        let mockNetwork = MockNetwork()
        let mockCoordinator = MockCoordinator(navigationController: UINavigationController())
        let mockSearchViewModel = MockSearchViewModel(network: mockNetwork)
        let sut = makeSUT(coordinator: mockCoordinator, viewModel: mockSearchViewModel)
        let navigationController = UINavigationController(rootViewController: sut)
       
        sut.viewWillAppear(true)
        
        XCTAssertFalse(navigationController.isNavigationBarHidden)
    }
    
    func makeSUT(coordinator: MockCoordinator, viewModel: SearchViewModel) -> SearchViewController {
        let sut = SearchViewController(viewModel: viewModel)
        sut.coordinator = coordinator
        return sut
    }
}
