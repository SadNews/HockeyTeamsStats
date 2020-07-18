//
//  PlayersListRouter.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 17.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol PlayersListRouterProtocol: class {
    func openPlayersDetailViewController(with team: Roster)
}

class PlayersListRouter {
    
    weak var viewController: PlayersListViewController!
    
    init(viewController: PlayersListViewController) {
        self.viewController = viewController
    }
}

extension PlayersListRouter: PlayersListRouterProtocol {
    func openPlayersDetailViewController(with team: Roster){
        //    viewController.performSegue(withIdentifier: viewController.selfToTeamsDetailsSegueName, sender: team)
    }
}
