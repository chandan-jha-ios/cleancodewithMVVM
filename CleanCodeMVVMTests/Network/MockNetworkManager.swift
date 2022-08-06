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
    var isMock: Bool
    
    init(parser: JSONParser, isMock: Bool = true) {
        self.parser = parser
        self.isMock = isMock
    }
    
    func process<T: Resultable>(urlRequest: URLRequest,
                    type: T.Type,
                    completion: @escaping (NetworkResult<T>) -> Void) {
        do {
            let data = try parser.load()
            let result = T.result(responseData: data, isMock: isMock) as NetworkResult<T>
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
