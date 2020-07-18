//
//  PlayersListConfigurator.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 17.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol PlayersListConfiguratorProtocol: class {
    func configure(with view: PlayersListViewController)
}

class PlayersListConfigurator: PlayersListConfiguratorProtocol {
    func configure(with view: PlayersListViewController) {
        let presenter = PlayersListPresenter(view: view)
        let interactor = PlayersListInteractor(presenter: presenter)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
