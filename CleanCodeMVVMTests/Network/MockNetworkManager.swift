//
//  MockNetworkManager.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import Foundation
@testable import CleanCodeMVVM

struct MockNetworkManager<T: Resultable>: NetworkAdaptor {
    var parser: JSONParser
    
    init(parser: JSONParser ) {
        self.parser = parser
    }
    
    func process<T: Resultable>(urlRequest: URLRequest,
                    type: T.Type,
                    completion: @escaping (NetworkResult<T>) -> Void) {
        do {
            let data = try parser.load()
            let result = T.result(responseData: data, isMock: true) as NetworkResult<T>
            switch result {
            case let .success(model):
                completion(.success(model))
            case let .failure(error):
                completion(.failure(error))
            }
        } catch (let error) {
            completion(.failure(NetworkError(statusCode: nil,
                                             description: "\(T.self) \(ErrorKeys.parsingFailed.rawValue) \(error.localizedDescription)")))
        }
    }
    
}
