//
//  MetaData.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/** News media meta data */
struct MetaData: Codable {
    let url, format: String?
    let height, width: Float?
}
