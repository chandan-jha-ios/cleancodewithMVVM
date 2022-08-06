//
//  DashboardManager.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/**
 DashboardManager is responsible to deal with Repository and  provide the required information to source view model. Implementation will be hidden here and only the result will be passed to the source.
 In this manager we can do the customisation as per the requested model format.
 - Parameters:
    - repository: DashboardRepositoryFetchable will be passed here as a dependency to fetch the data and hide the implementation
 */

struct DashboardManager: DashboardManagerFetchable {
    
    let repository: DashboardRepositoryFetchable
    
    init(repository: DashboardRepositoryFetchable = DashboardRepository()) {
        self.repository = repository
    }
    
    /// fetchNews will request repository to fetch the news
    func fetchNews(request: Requestable, on completion: @escaping DashboardCompletion) {
        repository.fetchNews(request: request, on: completion)
    }
    
}
