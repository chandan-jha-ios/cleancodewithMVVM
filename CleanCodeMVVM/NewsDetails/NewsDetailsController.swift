//
//  NewsDetailsController.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

final class NewsDetailsController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Details"
    }

    class func loadController() -> NewsDetailsController {
        NewsDetailsController(nibName: NewsDetailsController.name, bundle: nil)
    }
}
