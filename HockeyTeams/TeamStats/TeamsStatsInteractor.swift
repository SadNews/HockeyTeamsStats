//
//  TeamsStatsInteractor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsStatsInteractorProtocol: class{
    func fetchStats()
}

protocol TeamsStatsInteractorOutputProtocol: class {
    func teamsStatsDidReceive(_ stats: [Records])
}

class TeamsStatsInteractor {
    
    weak var presenter: TeamsStatsInteractorOutputProtocol!
    
    required init(presenter: TeamsStatsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension TeamsStatsInteractor: TeamsStatsInteractorProtocol {
    
    func fetchStats()  {
        let url = "https://statsapi.web.nhl.com/api/v1/standings"
        NetworkManager.shared.fetchGenericJSONData(urlString: url) { [weak self] (stats: TeamsStats) in
            self?.presenter.teamsStatsDidReceive(stats.records!)
        }
    }
}
