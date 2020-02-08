//
//  CustomIconAPIManager.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

class CustomIconAPIManager {
    
    public static let shared = CustomIconAPIManager()
    private let request = Request<CustomIconAPI>()
    
    func listCustomIcons(completion: @escaping(_ icons: [Icon]?, _ error: NetworkError?) -> Void) {
        request.performGET(CustomIconAPI.listIcons) { (result: CustomIconResult?, error: NetworkError?) in
            guard let icons = result?.icons else {
                completion(nil, error)
                return
            }
            completion(icons.map { Icon(from: $0) }, error)
        }
    }
}

