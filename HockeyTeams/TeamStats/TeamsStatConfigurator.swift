//
//  TeamsStatConfigurator.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsStatsConfiguratorProtocol: class {
    func configure(with viewController: TeamsStatsViewController)
}

class TeamsStatsConfigurator: TeamsStatsConfiguratorProtocol {
    func configure(with viewController: TeamsStatsViewController) {
        let presenter = TeamsStatsPresenter(view: viewController)
        let interactor = TeamsStatsInteractor(presenter: presenter)
        let router = TeamsStatsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
