//
//  Router.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

protocol Router {
   func route(to routeID: String, from context: UIViewController, parameters: Any?)
}

struct DashboardRouter: Router {
    
    enum Route: String {
        case newsDetails = "details"
    }
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        guard let route = Route(rawValue: routeID) else { return }
        switch route {
        case .newsDetails:
            let controller = NewsDetailsController.loadController()
            weak var source = context
            source?.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
