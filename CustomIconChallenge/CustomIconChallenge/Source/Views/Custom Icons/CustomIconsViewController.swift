//
//  CustomIconsViewController.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

final class CustomIconsViewController: UIViewController {
    
    @IBOutlet private weak var customIconsTableView: UITableView!
    
    private let cellID = "IconTableViewCell"
    private var iconsViewModel = [IconViewModel]()
    private var filteredIconsViewModel = [IconViewModel]()
    private var searchController: UISearchController?
    
    private var isSearching: Bool {
        return !(searchController?.searchBar.text?.isEmpty ?? true)
    }
    
    // MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Custom Icons"
        
        customIconsTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = false
        getIconsFromAPI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    // MARK: - SearchResultsController setup
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = "Search"
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Data loading
    private func getIconsFromAPI() {
        CustomIconAPIManager.shared.listCustomIcons { [weak self] (icons, error) in
            guard let strongSelf = self, let icons = icons else { return }
            
            strongSelf.iconsViewModel = icons.map { IconViewModel(icon: $0) }
            strongSelf.customIconsTableView.reloadData()
        }
    }
    
    // MARK: - Data filtering
    private func filterIcons() {
        guard let text = (searchController?.searchBar.text)?.lowercased() else { return }
        
        filteredIconsViewModel = iconsViewModel.filter { $0.title.lowercased().contains(text) || $0.subtitle.lowercased().contains(text) }
        customIconsTableView.reloadData()
    }
}

// MARK: - UITableView delegate and datasource methods
extension CustomIconsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearching ? filteredIconsViewModel.count : iconsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let icons = isSearching ? filteredIconsViewModel : iconsViewModel
        
        guard
            icons.indices.contains(indexPath.row),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? IconTableViewCell else {
                return UITableViewCell()
        }
        
        cell.setupCell(with: icons[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
}

// MARK: - UISearchResultsUpdating delegate
extension CustomIconsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterIcons()
    }
}
