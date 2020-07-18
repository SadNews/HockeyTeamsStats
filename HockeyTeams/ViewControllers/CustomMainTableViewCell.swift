//
//  CustomMainTableViewCell.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 14.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

class CustomMainViewCell: UITableViewCell {

    @IBOutlet weak var teamIcon: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamIdLabel: UILabel!
    
    func configure(with teams: Teams) {
        teamNameLabel.text = teams.name
        teamIdLabel.text = teams.venue?.city
          teamIcon.image = UIImage(named: (teams.name ?? nil)!)
      }
    
}
