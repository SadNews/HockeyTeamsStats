//
//  TeamsListViewController.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 07.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

protocol TeamsListViewProtocol: class {
    var selfToTeamsDetailsSegueName: String { get }
    func reloadData()
}

class TeamsListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var presenter: TeamsListPresenterProtocol!
    var selfToTeamsDetailsSegueName = "showDetails"
    
    private let configurator: TeamsListConfiguratorProtocol = TeamsListConfigurator()
    private let searchController = UISearchController()
    private var searchBarIsEmpty: Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    private var isSearching: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupSearchBar()
    }
    
    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
}

extension TeamsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return presenter.filterSearch.count
        }
        return presenter.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let teams = isSearching ? presenter.filterSearch[indexPath.row] : presenter.teams[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomMainViewCell
        cell.configure(with: teams)
        return cell
    }
}

extension TeamsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.showTeamsDetails(for: indexPath)
    }
}

extension TeamsListViewController: TeamsListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension TeamsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(for: searchController.searchBar.text!)
        
    }
    func filterContentForSearchText(for searchText: String) {
        presenter.filterSearch = (presenter.teams.filter({ (teamName) -> Bool in
            return (teamName.name?.lowercased().contains(searchText.lowercased()) ?? false)
        }))
        tableView.reloadData()
    }
}
