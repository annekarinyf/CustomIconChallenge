//
//  IconsViewController.swift
//  CustomIconChallenge
//
//  Created by Anne Kariny Silva Freitas on 08/02/20.
//  Copyright © 2020 Anne Kariny Silva Freitas. All rights reserved.
//

import UIKit

// Class to present a list of possible custom icons from an app
final class IconsViewController: UIViewController {
    
    @IBOutlet private weak var iconsTableView: UITableView!
    
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
        title = NSLocalizedString("Custom Icons", comment: "View Title")
        
        iconsTableView.register(UINib(nibName: cellID, bundle: nil), forCellReuseIdentifier: cellID)
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getIconsFromAPI()
    }
    
    // MARK: - SearchResultsController setup
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.searchResultsUpdater = self
        searchController?.obscuresBackgroundDuringPresentation = false
        searchController?.searchBar.placeholder = NSLocalizedString("Search", comment: "Search description")
        
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    // MARK: - Data loading
    private func getIconsFromAPI() {
        IconsAPIManager.shared.listCustomIcons { [weak self] (icons, error) in
            guard let strongSelf = self, let icons = icons, error == nil else {
                self?.handleGetIconsError(error)
                return
            }
            
            strongSelf.iconsViewModel = icons.map { IconViewModel(icon: $0) }
            strongSelf.iconsTableView.reloadData()
        }
    }
    
    // MARK: - Data filtering
    private func filterIcons() {
        guard let text = (searchController?.searchBar.text)?.lowercased() else { return }
        
        filteredIconsViewModel = iconsViewModel.filter { $0.title.lowercased().contains(text) || $0.subtitle.lowercased().contains(text) }
        iconsTableView.reloadData()
    }
    
    // MARK: - Errors handling
    private func handleGetIconsError(_ error: NetworkError?) {
        let title = NSLocalizedString("Error", comment: "Alert Title")
        let errorMessage = error?.errorMessage
        
        AlertHelper.presentOKAlert(in: self, title: title, message: errorMessage)
    }
}

// MARK: - UITableView delegate and datasource methods
extension IconsViewController: UITableViewDataSource, UITableViewDelegate {
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
extension IconsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterIcons()
    }
}