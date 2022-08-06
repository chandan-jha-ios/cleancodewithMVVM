//
//  DashboardResponse.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/** Dashboard api response  structure
This model inheriting the `Resultable` to fulfill the network supported format to convert the data in custom response format of success or failure
`ResponsePresentable` will give flexibility to pass the status as read only if in some case only status required.
 */
struct DashboardResponse: Resultable, ResponsePresentable {
    var status: String?
    let copyright: String?
    let numResults: Int?
    let results: [News]?
    
    private enum CodingKeys: String, CodingKey {
        case status, copyright, results
        case numResults = "num_results"
    }
}
