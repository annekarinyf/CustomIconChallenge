//
//  IconTableViewCell.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

final class IconTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    
    private var activityIndicator: UIActivityIndicatorView?
    
    // MARK: - Cell loading and setup
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCellLayout()
        setupActivityIndicatorForImageView()
    }
    
    func setupCell(with icon: IconViewModel) {
        titleLabel.text = icon.title
        subtitleLabel.text = icon.subtitle
        
        // Image downloading
        activityIndicator?.startAnimating()
        
        icon.getImage { [weak self] image in
            guard let strongSelf = self else { return }
            strongSelf.iconImageView.image = image
            strongSelf.activityIndicator?.stopAnimating()
        }
    }
    
    // MARK: - Cell layout configuration
    private func setupCellLayout() {
        setupShadow()
        setupRoundedBorder()
    }
    
    private func setupShadow() {
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 3
        
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
        containerView.layer.rasterizationScale = UIScreen.main.scale
        containerView.layer.shouldRasterize = true
    }
    
    private func setupRoundedBorder() {
        containerView.layer.cornerRadius = 8
    }
    
    // Setup activity indicador for image downloading
    private func setupActivityIndicatorForImageView() {
        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator?.hidesWhenStopped = true
        activityIndicator?.center = iconImageView.center
        activityIndicator?.stopAnimating()
        
        guard let indicatorView = activityIndicator else { return }
        iconImageView.addSubview(indicatorView)
    }
}
