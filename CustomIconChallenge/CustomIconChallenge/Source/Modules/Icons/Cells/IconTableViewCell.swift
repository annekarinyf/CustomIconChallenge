//
//  IconTableViewCell.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

// Cell to present icon information
final class IconTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: ShadowView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var imageLoadingIndicator: UIActivityIndicatorView!
    
    func setupCell(with icon: IconViewModel) {
        titleLabel.text = icon.title
        subtitleLabel.text = icon.subtitle
        
        setupImage(from: icon)
    }
    
    private func setupImage(from icon: IconViewModel) {
        imageLoadingIndicator.startAnimating()
        
        icon.getImage { [weak self] image in
            guard let strongSelf = self else { return }
            strongSelf.iconImageView.image = image
            strongSelf.imageLoadingIndicator.stopAnimating()
        }
    }
}
