//
//  PlayersInfoViewController.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

class PlayersInfoViewController: UITableViewController {
    
    private var roster: [Roster]?
    
    var teamName: String!
    var teamID: Int!
    private var aView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        self.startLoading()
        NetworkManager.shared.playersDataParse(from: teamID) { value in
            DispatchQueue.main.async {
                self.roster = value
                self.tableView.reloadData()
                self.stopLoading()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roster?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playersCell", for: indexPath) as! PlayersInfoCustomTableViewCell
        let player = roster?[indexPath.row]
        
        cell.configure(with: player)
        
        return cell
    }
}

extension PlayersInfoViewController {
    // Activity Indicator
    func startLoading(){
        aView = UIView(frame: self.view.bounds)
        let ai = UIActivityIndicatorView(style: .large)
        ai.center = aView!.center
        ai.startAnimating()
        aView?.addSubview(ai)
        self.view.addSubview(aView!)
    }
    
    func stopLoading(){
        aView?.removeFromSuperview()
        aView = nil
    }
}
