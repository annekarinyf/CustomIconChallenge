//
//  CustomIconsViewController.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

class CustomIconsViewController: UIViewController {
    @IBOutlet private weak var customIconsTableView: UITableView!
    private let cellID = "IconTableViewCell"
    private var iconsViewModel = [IconViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customIconsTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getIconsFromAPI()
    }
    
    private func getIconsFromAPI() {
        CustomIconAPIManager.shared.listCustomIcons { [weak self] (icons, error) in
            guard let strongSelf = self, let icons = icons else { return }
            
            strongSelf.iconsViewModel = icons.map { IconViewModel(icon: $0) }
            strongSelf.customIconsTableView.reloadData()
        }
    }
}

// MARK: - UITableView Methods
extension CustomIconsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iconsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            iconsViewModel.indices.contains(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? IconTableViewCell else {
                return UITableViewCell()
        }
        cell.setupCell(with: iconsViewModel[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}


