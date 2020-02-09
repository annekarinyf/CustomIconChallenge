//
//  ShadowView.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import Foundation
import UIKit

// Represents a view with a smooth shadow and rounded borders
final class ShadowView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addShadow()
        addRoundedBorder()
    }
    
    private func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 3
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.rasterizationScale = UIScreen.main.scale
        layer.shouldRasterize = true
    }
    
    private func addRoundedBorder() {
        layer.cornerRadius = 8
    }
}
