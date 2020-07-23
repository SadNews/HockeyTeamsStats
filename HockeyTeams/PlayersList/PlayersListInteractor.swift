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
        let url = "https://statsapi.web.nhl.com/api/v1/teams/\(teamId)/roster"
        NetworkManager.shared.fetchGenericJSONData(urlString: url) { [weak self] (roster: PlayersData) in            self?.presenter.playersDidReceive(roster.roster)
        }
    }
}
