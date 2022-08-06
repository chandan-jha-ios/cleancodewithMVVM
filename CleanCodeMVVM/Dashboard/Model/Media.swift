//
//  Media.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/** News media model structure */
struct Media: Codable {
    let type,
        subtype,
        caption,
        copyright: String?
    let meta: [MetaData]?
    
    private enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case meta = "media-metadata"
    }
}
