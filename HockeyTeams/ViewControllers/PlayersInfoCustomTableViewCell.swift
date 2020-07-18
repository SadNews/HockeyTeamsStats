//
//  PlayersInfoCustomTableViewCell.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

class PlayersInfoCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerNumber: UILabel!
    @IBOutlet weak var playerPosition: UILabel!
    @IBOutlet weak var playerPositionType: UILabel!
    
    func configure(with result: Roster?) {
        

        playerName.text = "Name: \(result?.person?.fullName ?? "")"
        self.playerNumber.text = "Jersey number: \(result?.jerseyNumber ?? "")"
        self.playerPosition.text = "Position: \(result?.position?.name ?? "")"
        self.playerPositionType.text = "Position type: \(result?.position?.type ?? "")"
    }
}
