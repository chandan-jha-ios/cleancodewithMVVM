//
//  DashboardService.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 05/08/22.
//

import Foundation
import Alamofire

/** DashboardService will be used to request different network call. Currently only news is supported */
enum DashboardService: Requestable {
    case news

    var method: RequestMethod {
        .GET
    }
    
    var encoding: URLEncoding {
        .default
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
