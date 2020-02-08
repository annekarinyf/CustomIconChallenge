//
//  IconViewModel.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation
import UIKit

class IconViewModel {
    private var icon: Icon
    var image: UIImage?
    
    // MARK: Initializer
    init(icon: Icon) {
        self.icon = icon
    }
    
    // MARK: Computed properties
    var title: String {
        return icon.title
    }
    
    var subtitle: String {
        return icon.subtitle
    }
    
    // MARK: View model's functions
    func getImage(_ completion: @escaping (UIImage?) -> Void) {
        if let image = image {
            completion(image)
        } else {
            guard let imageURL = icon.url else {
                completion(nil)
                return
            }
            
            URLHelper.downloadImage(withURL: imageURL) { [weak self] image in
                guard let strongSelf = self else {
                    completion(nil)
                    return
                }
                
                strongSelf.image = image
                completion(image)
            }
        }
    }
}
