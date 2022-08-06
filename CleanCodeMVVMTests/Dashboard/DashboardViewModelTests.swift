//
//  DashboardViewModelTests.swift
//  DashboardViewModelTests
//
//  Created by Chandan Jha on 04/08/22.
//

import XCTest
@testable import CleanCodeMVVM

final class DashboardViewModelTests: XCTestCase {
    
    var viewModel: DashboardViewModel!
    
    private func initializeViewModel(fileName: String = "mock_dashboard",
                                     isMock: Bool = true) {
        let parser = JSONParser(fileName: fileName)
        let adaptor = MockNetworkManager<DashboardResponse>(parser: parser,
                                                            isMock: isMock)
        let repository = DashboardRepository(manager: adaptor)
        let manager = DashboardManager(repository: repository)
        let router = DashboardRouter(context: UINavigationController())
        viewModel = DashboardViewModel(manager: manager, router: router)
    }
    
    func testNewsRequest() {
        initializeViewModel()
        viewModel.fetchNews { [weak self ] in
            XCTAssertNil(self?.viewModel.error)
            XCTAssertNotNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 20)
            do {
                let news = try XCTUnwrap(self?.viewModel.news(at: 4))
                XCTAssertFalse(news.thumbnail.isEmpty)
            } catch {
                XCTFail("News not found at index 4")
            }
            self?.viewModel.navigatetoDetails(for: 1)
        }
    }
    
    func testLiveNewsRequest() {
        viewModel = DashboardViewModel()
        let expectation = XCTestExpectation(description: "live request")
        viewModel.fetchNews { [weak self ] in
            XCTAssertNil(self?.viewModel.error)
            XCTAssertNotNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 20)
            do {
                let news = try XCTUnwrap(self?.viewModel.news(at: 4))
                XCTAssertFalse(news.thumbnail.isEmpty)
            } catch {
                XCTFail("News not found at index 4")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testLiveFailureNewsRequest() {
        viewModel = DashboardViewModel()
        let expectation = XCTestExpectation(description: "live request")
        viewModel.fetchNews(service: MockService.news) { [weak self ] in
            XCTAssertNotNil(self?.viewModel.error)
            XCTAssertNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5)
    }
    
    func testFileLoadingFailureScenario() {
        initializeViewModel(fileName: "mock", isMock: false)
        viewModel.fetchNews { [weak self ] in
            XCTAssertNotNil(self?.viewModel.error)
            XCTAssertNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 0)
            XCTAssertNil(self?.viewModel.news(at: 4))
        }
    }
    
    func testParsingFailureScenario() {
        initializeViewModel(fileName: "mock_invalid_response")
        viewModel.fetchNews { [weak self ] in
            XCTAssertNotNil(self?.viewModel.error)
            XCTAssertNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 0)
            XCTAssertNil(self?.viewModel.news(at: 4))
        }
    }
    
    func testServiceRequestFailure() {
        initializeViewModel(fileName: "mock_invalid_response")
        viewModel.fetchNews(service: MockService.news) { [weak self ] in
            XCTAssertNotNil(self?.viewModel.error)
            XCTAssertNil(self?.viewModel.response)
            XCTAssertEqual(self?.viewModel.news.count, 0)
            XCTAssertNil(self?.viewModel.news(at: 4))
        }
    }
    
    func testUtility() {
        let color = UIColor(hexString: "#000000")
        XCTAssertEqual(color.toHexString(), "#000000")
    }
     
}

