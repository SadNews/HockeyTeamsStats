//
//  TeamsListConfigur.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 07.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsListConfiguratorProtocol: class {
    func configure(with viewController: TeamsListViewController)
}

class TeamsListConfigurator: TeamsListConfiguratorProtocol {
    func configure(with viewController: TeamsListViewController) {
        let presenter = TeamsListPresenter(view: viewController)
        let interactor = TeamsListInteractor(presenter: presenter)
        let router = TeamsListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
