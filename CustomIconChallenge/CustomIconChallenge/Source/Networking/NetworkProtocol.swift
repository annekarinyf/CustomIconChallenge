//
//  NetworkProtocol.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

/// Network protocols and enum for endpoints and request classes
enum HttpMethod: String {
    case get = "GET"
}

protocol EndPointType {
    var url: URL? { get }
    var path: String { get }
}

protocol NetworkProtocol {
    associatedtype EndPoint: EndPointType
    func perform<T: Decodable>(_ method: HttpMethod, _ route: EndPoint, completion: @escaping (T?, NetworkError?) -> Void)
    func cancel()
}
