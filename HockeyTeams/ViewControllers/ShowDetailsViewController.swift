//
//  ShowDetailsViewController.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import UIKit

class ShowDetailsViewController: UIViewController {
    
    @IBOutlet weak var teamLogo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamCity: UILabel!
    @IBOutlet weak var teamVanue: UILabel!
    @IBOutlet weak var firstYearOfPlay: UILabel!
    @IBOutlet weak var teamSite: UITextView!
    
    var teamInfo: Teams!
    var name: String!
    var id: Int!
    
    @IBAction func btn(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamSite.isEditable = false
        teamSite.dataDetectorTypes = .link
        teamName.text = ("Name: \((teamInfo?.name) ?? "") " )
        teamLogo.image = UIImage(named: teamInfo?.name ?? "")
        teamCity.text = ("City: \((teamInfo?.venue?.city) ?? "") ")
        teamVanue.text = ("Venue: \(teamInfo?.venue?.name ?? "")")
        firstYearOfPlay.text = ("First year of play: \(teamInfo?.firstYearOfPlay ?? "") ")
        teamSite.text = ("Web site: \(teamInfo?.officialSiteUrl ?? "")")
        
    }
}
