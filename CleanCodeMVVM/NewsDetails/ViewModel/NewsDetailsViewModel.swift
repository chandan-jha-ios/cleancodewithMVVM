//
//  NewsDetailsViewModel.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import Combine

/** All the business functionality of NewsDetailsViewModel feature is implemented here
 - Parameters:
    - router: to deal with view and flow of navigations
    - news: Model data to show the informatin
 */
final class NewsDetailsViewModel {
    
    // MARK: Properties
    private var router: ChildRouter?
    private let news: News

    // MARK: Initializer
    init(router: ChildRouter? = nil,
         news: News) {
        self.router = router
        self.news = news
    }

    // MARK: Functions
    
    var title: String? {
        news.title
    }
    
    var abstract: String? {
        news.abstract
    }
    
    var media: Media? {
        news.media?.first
    }
    
    var author: String? {
        news.byline
    }
    
    var source: String? {
        news.source
    }
    
    var dateTime: String? {
        news.published_date
    }
}

extension NewsDetailsViewModel {
    
    func pop() {
        router?.back()
    }
}
