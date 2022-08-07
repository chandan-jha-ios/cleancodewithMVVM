//
//  NewsDetailsViewModelTests.swift
//  CleanCodeMVVMTests
//
//  Created by Chandan Jha on 06/08/22.
//

import XCTest
@testable import CleanCodeMVVM

final class NewsDetailsViewModelTests: XCTestCase {
    var viewModel: DashboardViewModel!
    var router: ParentRouter!
    
    private func initializeViewModel(fileName: String = "mock_dashboard",
                                     isMock: Bool = true) {
        let parser = JSONParser(fileName: fileName)
        let adaptor = MockNetworkManager<DashboardResponse>(parser: parser,
                                                            isMock: isMock)
        let repository = DashboardRepository(manager: adaptor)
        let manager = DashboardManager(repository: repository)
        router = DashboardRouter(context: UINavigationController())
        viewModel = DashboardViewModel(manager: manager, router: router)
    }
    
    func testDetailsViewModel_Success() {
        initializeViewModel()
        viewModel.fetchNews {
            XCTAssertNil(self.viewModel.error)
            XCTAssertNotNil(self.viewModel.response)
            do {
                let news = try XCTUnwrap(self.viewModel.news(at: 4))
                let childRouter = NewsDetailsRouter(context: self.router.context)
                let detailsViewModel = NewsDetailsViewModel(router: childRouter, news: news)
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

