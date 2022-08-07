//
//  Constant.swift
//  CleanCodeMVVM
//
//  Created by Chandan Jha on 06/08/22.
//

import UIKit

struct Constant {
    static var baseUrl: String {
        "https://api.nytimes.com"
    }
    static var apiKey: String {
        "UPDATE KEY HERE"
    }
}

enum AppColor {
    case theme
    case black
    
    var value: UIColor {
        switch self {
        case .theme:
            return UIColor(hexString: "#77E0C1")
        case .black:
            return UIColor.black
        }
    }
}
