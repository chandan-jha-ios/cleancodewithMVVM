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

extension Media {
    
    var thumbnail: String {
        meta?.first?.url ?? ""
    }
    
    var gridIcon: String {
        guard let meta = meta,
              meta.count > 1 else { return ""}
        return meta[1].url ?? ""
    }
    
    var banner: String {
        meta?.last?.url ?? ""
    }
}
