//
//  News.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 04/08/22.
//

import Foundation

/** News response structure */
struct News: Codable {
    let source,
        published_date,
        section,
        byline,
        type,
        title,
        abstract: String?
    let media: [Media]?
}

extension News {
    
    var thumbnail: String {
        media?.first?.meta?.first?.url ?? ""
    }
}
