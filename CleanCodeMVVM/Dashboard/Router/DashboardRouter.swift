//
//  DashboardRouter.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

enum DashboardRoute: String {
    case newsDetails = "details"
}

struct DashboardRouter: ParentRouter {
    
    weak var context: UINavigationController?
        
    func route(to routeId: String, parameters: Any?) {
        guard let route = DashboardRoute(rawValue: routeId) else { return }
        switch route {
        case .newsDetails:
            showNewsDetails(with: parameters)
        }
    }
    
    private func showNewsDetails(with parameters: Any?) {
        let controller = NewsDetailsController.loadController()
        guard let news = parameters as? News else { return }
        let childRouter = NewsDetailsRouter(context: context)
        let viewModel = NewsDetailsViewModel(router: childRouter, news: news)
        controller.configure(with: viewModel)
        context?.pushViewController(controller, animated: true)
    }
}
