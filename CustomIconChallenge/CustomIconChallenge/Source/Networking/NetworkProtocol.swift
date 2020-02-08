//
//  NetworkProtocol.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

// MARK: Protocols for API
public protocol EndPointType {
    var url: URL? { get }
    var path: String { get }
}

protocol NetworkProtocol {
    associatedtype EndPoint: EndPointType
    func performGET<T: Decodable>(_ route: EndPoint, completion: @escaping (T?, NetworkError?) -> Void)
    func cancel()
}
