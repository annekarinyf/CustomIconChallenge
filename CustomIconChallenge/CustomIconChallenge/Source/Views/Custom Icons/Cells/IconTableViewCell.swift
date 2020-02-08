//
//  IconTableViewCell.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

class IconTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    func setupCell(with icon: IconViewModel) {
        titleLabel.text = icon.title
        subtitleLabel.text = icon.subtitle
    }
    
    func setImage(_ image: UIImage?) {
        iconImageView.image = image
    }
}
