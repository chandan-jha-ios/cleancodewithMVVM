//
//  DashboardRouter.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

struct DashboardRouter: ParentRouter {
    
    weak var context: UINavigationController?
    
    enum Route: String {
        case newsDetails = "details"
    }
    
    func route(to routeID: String, parameters: Any?) {
        guard let route = Route(rawValue: routeID) else { return }
        switch route {
        case .newsDetails:
            let controller = NewsDetailsController.loadController()
            guard let news = parameters as? News else { return }
            let childRouter = NewsDetailsRouter(context: context)
            let viewModel = NewsDetailsViewModel(router: childRouter, news: news)
            controller.configure(with: viewModel)
            context?.pushViewController(controller, animated: true)
        }
    }
}
