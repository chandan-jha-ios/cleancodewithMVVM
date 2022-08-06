//
//  NewsDetailsViewModelTests.swift
//  CleanCodeMVVMTests
//
//  Created by Chandan Jha on 06/08/22.
//

import XCTest
@testable import CleanCodeMVVM

final class NewsDetailsViewModelTests: XCTestCase {
    
    func testDetailsViewModel() {
        let parser = JSONParser(fileName: "mock_dashboard")
        let adaptor = MockNetworkManager<DashboardResponse>(parser: parser,
                                                            isMock: true)
        let repository = DashboardRepository(manager: adaptor)
        let manager = DashboardManager(repository: repository)
        let router = DashboardRouter(context: UINavigationController())
        let viewModel = DashboardViewModel(manager: manager, router: router)

        viewModel.fetchNews {
            XCTAssertNil(viewModel.error)
            XCTAssertNotNil(viewModel.response)
            do {
                let news = try XCTUnwrap(viewModel.news(at: 4))
                let detailsViewModel = NewsDetailsViewModel(router: router, news: news)
                XCTAssertNotNil(detailsViewModel.title)
                XCTAssertNotNil(detailsViewModel.abstract)
                XCTAssertNotNil(detailsViewModel.media)
                XCTAssertNotNil(detailsViewModel.author)
                XCTAssertNotNil(detailsViewModel.source)
                XCTAssertNotNil(detailsViewModel.dateTime)
                XCTAssertFalse(detailsViewModel.media?.banner.isEmpty ?? true)
                XCTAssertFalse(detailsViewModel.media?.gridIcon.isEmpty ?? true)
                XCTAssertFalse(detailsViewModel.media?.thumbnail.isEmpty ?? true)
            } catch {
                XCTFail("News node not found at index 4 while testDetailsViewModel")
            }
        }
    }
}

