//
//  CustomIconEndpoint.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

enum CustomIconAPI {
    case listIcons
}

extension CustomIconAPI: EndPointType {
    static let address = "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/IconsData.json"
    
    var path: String {
        return CustomIconAPI.address
    }
    
    var url: URL? {
        return URL(string: path)
    }
}
