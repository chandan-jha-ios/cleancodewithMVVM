//
//  Fetchable.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 05/08/22.
//

import Foundation

/**
 DashboardRepositoryFetchable is responsible  to fetch news from server
 `fetchNews` function can be used for the same to implement it and `DashboardCompletion`
 Repository will provide the response as it is from server to the source Manager Fetchable
 */
protocol DashboardRepositoryFetchable {
    func fetchNews(request: Requestable, on completion: @escaping DashboardCompletion)
}


/**
 DashboardManagerFetchable is responsible  to request repository to provide the  news
 `fetchNews` function can be used for the same to implement it and `DashboardCompletion` will give surety on it.
 Source viewmodel can use this protocol to get result with hiding the  implementation
 ManagerFetchable can customise the data if required any 
 */

protocol DashboardManagerFetchable {
    func fetchNews(request: Requestable, on completion: @escaping DashboardCompletion)
}
