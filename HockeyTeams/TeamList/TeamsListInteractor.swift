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
        NetworkManager.shared.teamsDataParse { [weak self] teams in
            self?.presenter.teamsDidReceive(teams)
        }
    }
}
