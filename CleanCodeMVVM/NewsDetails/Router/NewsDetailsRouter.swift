//
//  NewsDetailsRouter.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 07/08/22.
//

import UIKit

struct NewsDetailsRouter: ChildRouter {

    var context: UINavigationController?
    
    func back() {
        context?.popViewController(animated: true)
    }
}
