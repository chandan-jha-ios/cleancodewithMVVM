//
//  Router.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

protocol Route {
    var context: UINavigationController? { get }
    func route(to routeID: String, parameters: Any?)
}

protocol Router: Route {
    func back()
}
