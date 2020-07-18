//
//  PlayersListViewController.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 17.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

protocol PlayersListViewProtocol: class {
    func reloadData()
}

class PlayersListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: PlayersListPresenterProtocol!
    private let configurator: PlayersListConfiguratorProtocol = PlayersListConfigurator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        
        presenter.viewDidLoad()
    }
}

extension PlayersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.playersCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let players = presenter.players[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "playersCell", for: indexPath) as! PlayersInfoCustomTableViewCell
        cell.configure(with: players)
        return cell
    }
}

extension PlayersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //  presenter.showTeamsDetails(for: indexPath)
    }
}

extension PlayersListViewController: PlayersListViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

