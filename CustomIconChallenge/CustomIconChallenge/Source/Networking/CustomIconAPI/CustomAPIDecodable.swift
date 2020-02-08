//
//  CustomAPIDecodable.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

// MARK: - CustomIconResult
struct CustomIconResult: Codable {
    let icons: [Icon]
}

// MARK: - Icon
struct Icon: Codable {
    let title: String
    let subtitle: String
    let image: String
}
