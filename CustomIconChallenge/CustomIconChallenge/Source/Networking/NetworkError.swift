//
//  NetworkError.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

/// Possible errors for API requests
enum NetworkError: Error {
    case internetUnavailable
    case invalidURL
    case unexpectedDataError
    case unknownError
    
    var errorMessage: String {
        switch self {
        case .internetUnavailable:
            return NSLocalizedString("Internet Unavailable Message", comment: "Search description")
        default:
            return NSLocalizedString("Unknown Error Message", comment: "Search description")
        }
    }
}
