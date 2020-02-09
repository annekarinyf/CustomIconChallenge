//
//  IconsAPIManager.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

/// Manager icon's API requests calling and responses
final class IconsAPIManager {
    
    public static let shared = IconsAPIManager()
    private let request = Request<IconsAPI>()
    
    func listCustomIcons(completion: @escaping(_ icons: [Icon], _ error: NetworkError?) -> Void) {
        request.perform(.get, IconsAPI.listIcons) { (result: IconResult?, error: NetworkError?) in
            guard let icons = result?.icons else {
                completion([], error)
                return
            }
            completion(icons.map { Icon(from: $0) }, error)
        }
    }
}

