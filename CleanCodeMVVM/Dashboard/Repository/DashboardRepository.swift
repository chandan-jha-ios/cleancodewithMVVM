//
//  DashboardRepository.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/**
 DashboardRepository is responsible  to provide the data to manager via network adaptor
 `fetchNews` function can be used for the same to implement it and `DashboardCompletion` will give surety on it.
 Here repository will return the completion result as per the format defined in `DashboardCompletion`
 */

struct DashboardRepository: DashboardRepositoryFetchable {
    let manager: NetworkAdaptor
    
    init(manager: NetworkAdaptor = NetworkManager()) {
        self.manager = manager
    }
    
    func fetchNews(request: Requestable, on completion: @escaping DashboardCompletion) {
        do {
            let urlRequest = try request.urlRequest()
            manager.process(urlRequest: urlRequest, type: DashboardResponse.self) { result in
                switch result {
                case let .success(response):
                    completion(response, nil)
                case let .failure(error):
                    completion(nil, error)
                }
            }
        } catch {
            completion(nil, NetworkError(statusCode: nil, description: "Url parsing failed"))
        }
    }    
}
