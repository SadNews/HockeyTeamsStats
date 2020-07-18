//
//  PlayersListInteractor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 17.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol PlayersListInteractorProtocol: class{
    func fetchPlayers()
}

protocol PlayersListInteractorOutputProtocol: class {
    func playersDidReceive(_ teams: [Roster])
}

class PlayersListInteractor {
    weak var presenter: PlayersListInteractorOutputProtocol!
    var teamId = 18
    init(presenter: PlayersListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension PlayersListInteractor: PlayersListInteractorProtocol {
    func fetchPlayers() {
        NetworkManager.shared.playersDataParse(from: teamId) { [weak self] roster in
            self?.presenter.playersDidReceive(roster)
        }
    }
}
