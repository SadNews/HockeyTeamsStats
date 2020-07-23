//
//  TeamsStatsViewController.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

protocol TeamsStatsViewProtocol: class {
    func reloadData()
    func alert(Message: String)
    func refreshControlSetup()
}
final class TeamsStatsViewController: UIViewController {
    var refreshControl = UIRefreshControl()
    var presenter: TeamsStatsPresenterProtocol!
    private let configurator: TeamsStatsConfiguratorProtocol = TeamsStatsConfigurator()
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func btnSegmentedControl(_ sender: UISegmentedControl) {
        tableView.reloadData()
    }
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        refreshControlSetup()
    }
    
    @objc func refresh(_ sender: Any) {
        presenter.viewDidLoad()
        refreshControl.endRefreshing()
    }
    
    func refreshControlSetup() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func alert(Message: String){
        let alert = UIAlertController(title: "Alert", message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension TeamsStatsViewController: TeamsStatsViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension TeamsStatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return presenter.eastRecordCount ?? 0
        case 1:
            return presenter.westRecordCount ?? 0
        default:
            return presenter.westAndEastCount ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "statsCell", for: indexPath) as! StatsCustomTableViewCell
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            cell.configure(with: presenter.eastRecords[indexPath.row], index: indexPath.row)
        case 1:
            cell.configure(with: presenter.westRecords[indexPath.row], index: indexPath.row)
        default:
            cell.configure(with: presenter.westAndEastRecords[indexPath.row], index: indexPath.row)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") 
        return headerCell
    }
}

extension TeamsStatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // presenter.(for: indexPath)
    }
}
