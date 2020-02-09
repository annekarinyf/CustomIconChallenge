//
//  URLHelper.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation
import UIKit

// Functions that  receives a URL and return data
struct URLHelper {
    static func downloadImage(withURL imageURL: URL, completion: @escaping (UIImage?) -> Void) {
        let imageDownloadQueue = DispatchQueue(label: "irapps.imageDownload", qos: .userInitiated)
        
        imageDownloadQueue.async {
            do {
                let data = try Data(contentsOf: imageURL)
                
                DispatchQueue.main.sync {
                    completion(UIImage(data: data))
                }
            } catch {
                debugPrint("Error downloading image")
                completion(nil)
            }
        }
    }
}
