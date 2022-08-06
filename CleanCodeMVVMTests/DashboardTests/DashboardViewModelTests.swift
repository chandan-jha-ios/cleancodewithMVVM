//
//  DashboardViewModelTests.swift
//  DashboardViewModelTests
//
//  Created by Chandan Jha on 04/08/22.
//

import XCTest
@testable import CleanCodeMVVM

class DashboardViewModelTests: XCTestCase {
    var viewModel: DashboardViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        initializeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    private func initializeViewModel() {
        let parser = JSONParser(fileName: "mock_dashboard")
        let adaptor = MockNetworkManager<DashboardResponse>(parser: parser)
        let repository = DashboardRepository(manager: adaptor)
        let manager = DashboardManager(repository: repository)
        viewModel = DashboardViewModel(manager: manager)
    }
    
    func testNewsRequest() {
        viewModel.fetchNews { [weak self ] in
            XCTAssertNil(self?.viewModel.error)
            XCTAssertNotNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 20)
        }
        
    }

}
