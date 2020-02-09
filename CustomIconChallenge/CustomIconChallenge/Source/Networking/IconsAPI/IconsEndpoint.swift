//
//  IconEndpoint.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

// Define icon's API funcionalities and endpoint variables
enum IconsAPI {
    case listIcons
}

extension IconsAPI: EndPointType {
    static let address = "https://irapps.github.io/wzpsolutions/tests/ios-custom-icons/IconsData.json"
    
    var path: String {
        return IconsAPI.address
    }
    
    var url: URL? {
        return URL(string: path)
    }
}
