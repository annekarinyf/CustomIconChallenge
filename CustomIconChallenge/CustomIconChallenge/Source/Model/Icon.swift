//
//  Icon.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

class Icon {
    let title: String
    let subtitle: String
    private let imageURLString: String
    
    init(from iconData: IconData) {
        self.title = iconData.title
        self.subtitle = iconData.subtitle
        self.imageURLString = iconData.image
    }
    
    var url: URL? {
        return URL(string: imageURLString)
    }
}
