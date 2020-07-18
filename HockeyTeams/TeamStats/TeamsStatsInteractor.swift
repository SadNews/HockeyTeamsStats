//
//  TeamsStatsInteractor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsStatsInteractorProtocol: class{
    func fetchTeams()
    func fetchStats()
}

protocol TeamsStatsInteractorOutputProtocol: class {
    func teamsDidReceive(_ teams: [Teams])
    func teamsStatsDidReceive(_ stats: [Records])
}

class TeamsStatsInteractor {
    weak var presenter: TeamsStatsInteractorOutputProtocol!
    
    required init(presenter: TeamsStatsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension TeamsStatsInteractor: TeamsStatsInteractorProtocol {
    func fetchTeams() {
        NetworkManager.shared.teamsDataParse { [weak self] teams in
            self?.presenter.teamsDidReceive(teams)
        }
    }
    
    func fetchStats() {
        NetworkManager.shared.stateParse { [weak self] stats in
            self?.presenter.teamsStatsDidReceive(stats)
        }
    }
}
