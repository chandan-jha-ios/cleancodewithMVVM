//
//  AppCoordinator.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

struct AppCoordinator {
    
    let window: UIWindow
    let router: AppRouter
    
    init(window: UIWindow) {
        self.window = window
        let navigation = UINavigationController()
        window.rootViewController = navigation
        router = AppRouter(context: navigation)
        start()
    }
    
    func start() {
        router.configureRoot()
    }
}

