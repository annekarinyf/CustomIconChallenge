//
//  IconAPIDecodable.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation

/// Decodes icons list and data
struct IconResult: Decodable {
    let icons: [IconData]
}

// MARK: - IconData
struct IconData: Decodable {
    let title: String
    let subtitle: String
    let image: String
}
