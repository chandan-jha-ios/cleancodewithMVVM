//
//  DashboardViewModel.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation
import Combine

/** All the business functionality of dashboard feature is implemented here
 - Parameters:
    - manager: manager is the DashboardManagerFetchable protocol help to request all the network call
    - router: router will do the view navigation operations
    - isLoading: to track the network requests status
 */

final class DashboardViewModel {
    
    // MARK: Properties
    private let manager: DashboardManagerFetchable
    private var router: ParentRouter?
    @Published var isLoading: Bool
    var response: DashboardResponse?
    var error: NetworkError?
    
    var news: [News] {
        response?.results ?? []
    }
    
    // MARK: Initializer
    init(manager: DashboardManagerFetchable = DashboardManager(),
         router: ParentRouter? = nil,
         isLoading: Bool = false) {
        self.manager = manager
        self.router = router
        self.isLoading = isLoading
    }

    // MARK: Functions
    func fetchNews(service: Requestable = DashboardService.news, completion: Completion? = nil) {
        manager.fetchNews(request: service) { [weak self] (response, error) in
            /// To track network operation and show loader in view
            if let error = error {
                self?.error = error
            } else {
                self?.response = response
            }
            self?.isLoading = false
            completion?()
        }
    }
    
    func news(at index: Int) -> News? {
        guard news.count > index else { return nil }
        return news[index]
    }
}

extension DashboardViewModel {
    
    /// Show news details page
    func navigatetoDetails(for index: Int) {
        router?.route(to: "details", parameters: news(at: index))
    }
}
