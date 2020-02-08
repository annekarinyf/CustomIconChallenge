//
//  NetworkError.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case internetUnavailable
    case invalidURL
    case unexpectedDataError
    case unknownError
}
