//
//  JSONParser.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import Foundation
@testable import CleanCodeMVVM

class JSONParser {
    
    private let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func load() throws -> Data {
        guard let path = Bundle(for: type(of: self)).path(forResource: fileName,
                                                          ofType: "json") else {
            fatalError("\(fileName).json \(ErrorKeys.fileNotFound)")
        }

        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path),
                                options: .mappedIfSafe)
            return data
        } catch {
            throw NetworkError(statusCode: nil,
                               description: ErrorKeys.somethingWentWrong.rawValue)
        }
    }
}
