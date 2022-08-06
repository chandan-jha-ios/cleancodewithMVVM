//
//  MockService.swift
//  CleanCodeMVVMTests
//
//  Created by Chandan Jha on 06/08/22.
//

import Alamofire
@testable import CleanCodeMVVM

enum MockService: Requestable {
    case news

    var method: RequestMethod {
        .POST
    }
    
    var encoding: URLEncoding {
        .default
    }
    
    var server: String? {
        nil
    }
    
    var params: [String : Any]? {
        nil
    }
    
    var path: String {
        "svc/mostpopular"
    }
    
    var endPoints: String? {
        "mostviewed/all-sections/7.json?api-key=2GXNO7VVpf3m0lwXt0QVNfJQNYHI41jF"
    }
    
    var version: Version {
        .v2
    }
}
