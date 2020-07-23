//
//  TeamsListInteractor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 07.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsListInteractorProtocol: class {
    func fetchTeams()
}

protocol TeamsListInteractorOutputProtocol: class {
    func teamsDidReceive(_ teams: [Teams])
}

class TeamsListInteractor {
    weak var presenter: TeamsListInteractorOutputProtocol!
    
    required init(presenter: TeamsListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension TeamsListInteractor: TeamsListInteractorProtocol {
    func fetchTeams() {
        let url = "https://statsapi.web.nhl.com/api/v1/teams"
        NetworkManager.shared.fetchGenericJSONData(urlString: url) { [weak self] (teams: TeamsData) in
            self?.presenter.teamsDidReceive(teams.teams)
        }
    }
}
