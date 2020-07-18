//
//  TeamsListRouter.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 07.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsListRouterProtocol: class {
    func openTeamsDetailViewController(with team: Teams)
}

class TeamsListRouter {
    
    weak var viewController: TeamsListViewController!
    
    init(viewController: TeamsListViewController) {
        self.viewController = viewController
    }
}

extension TeamsListRouter: TeamsListRouterProtocol {
    func openTeamsDetailViewController(with team: Teams){
        viewController.performSegue(
            withIdentifier: viewController.selfToTeamsDetailsSegueName,
            sender: team)
    }
}
