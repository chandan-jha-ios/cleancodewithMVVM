//
//  DashboardRepositoryPresentable.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/**
 ResponsePresentable will provide the status of api response model  to fetch news from server
 `status` key can give flexibility to verify our response state.
 It can be used in any  model as a protocol where it's response structure is same
 */
protocol ResponsePresentable {
    var status: String? { get }
}
