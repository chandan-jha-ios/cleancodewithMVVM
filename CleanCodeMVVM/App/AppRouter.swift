//
//  AppRouter.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 07/08/22.
//

import UIKit

struct AppRouter: Router {
    
    weak var context: UINavigationController?
    
    func configureRoot() {
        guard let controller = DashboardController.loadController() else { return }
        let viewModel = DashboardViewModel(router: DashboardRouter(context: context))
        controller.configure(viewModel: viewModel)
        context?.pushViewController(controller, animated: true)
    }
}
