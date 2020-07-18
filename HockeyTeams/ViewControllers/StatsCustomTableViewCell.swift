//
//  StatsCustomTableViewCell.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 14.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

class StatsCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamPoint: UILabel!
    @IBOutlet weak var placeNumber: UILabel!
    @IBOutlet weak var teamIcon: UIImageView!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    @IBOutlet weak var otLabel: UILabel!
    @IBOutlet weak var loseLabel: UILabel!
    
    func configure(with teams: TeamRecords, index: Int) {
        placeNumber.text = String(index + 1)
        teamName.text = teams.team?.name
        teamPoint.text = String(teams.points ?? 0)
        loseLabel.text = String(teams.leagueRecord?.losses ?? 0)
        winsLabel.text = String(teams.leagueRecord?.wins ?? 0)
        otLabel.text = String(teams.leagueRecord?.ot ?? 0)
        gamesPlayedLabel.text = String(teams.gamesPlayed ?? 0)
        teamIcon.image = UIImage(named: (teams.team?.name ?? nil)!)
    }
}
