//
//  TeamsStatsRouter.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsStatsRouterProtocol: class {
    
}

class TeamsStatsRouter {
    weak var viewController: TeamsStatsViewController!
    
    init(viewController: TeamsStatsViewController) {
        self.viewController = viewController
    }
}

extension TeamsStatsRouter: TeamsStatsRouterProtocol {
    func openTeamsDetailViewController(with team: Teams){
        //viewController.performSegue(withIdentifier: viewController.selfToTeamsDetailsSegueName, sender: team)
    }
}
