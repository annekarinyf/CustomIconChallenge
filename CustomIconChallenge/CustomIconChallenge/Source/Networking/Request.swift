//
//  Request.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

final class Request<T: EndPointType> {
    private var task: URLSessionTask?
    
    private func performRequest<U: Decodable>(request: URLRequest, completion: @escaping (U?, NetworkError?) -> Void) {
        guard Reachability.isConnectedToNetwork() else {
            debugPrint("Internet Unavailable")
            return DispatchQueue.main.async {completion(nil, .internetUnavailable) }
        }
        
        let session = URLSession.shared
        
        task = session.dataTask(with: request, completionHandler: { (data, _, error) in
            guard let responseData = data, error == nil else {
                if let error = error {
                    debugPrint("Unknown Error: \(error.localizedDescription)")
                }
                
                return DispatchQueue.main.async { completion(nil, .unknownError) }
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(U.self, from: responseData)
                
                DispatchQueue.main.async {
                    completion(decodedObject, nil)
                }
            } catch {
                debugPrint("Unexpected Data Error: \(error.localizedDescription)")
                DispatchQueue.main.async { completion(nil, .unexpectedDataError) }
            }
        })
        
        task?.resume()
    }
}

// MARK: - NetworkProtocol
extension Request: NetworkProtocol {
    func performGET<U: Decodable>(_ endPoint: T, completion: @escaping (U?, NetworkError?) -> Void) {
        guard let url = endPoint.url else {
            completion(nil, .invalidURL)
            return
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        request.httpMethod = "GET"
        
        performRequest(request: request, completion: completion)
    }
    
    func cancel() {
        task?.cancel()
    }
}
