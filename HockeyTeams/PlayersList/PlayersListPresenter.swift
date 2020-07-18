//
//  PlayersListPresenter.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 17.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol PlayersListPresenterProtocol: class {
    
    var players: [Roster] {get}
    var playersCount: Int? {get}
    func viewDidLoad()
    func players(atIndex IndexPath: IndexPath) -> Roster?
}

class PlayersListPresenter {
    
    weak var view: PlayersListViewProtocol!
    var interactor: PlayersListInteractorProtocol!
    var router: PlayersListRouterProtocol!
    
    var players: [Roster] = []
    var playersCount: Int? {
        players.count
    }
    
    required init(view: PlayersListViewProtocol) {
        self.view = view
    }
}

extension PlayersListPresenter: PlayersListPresenterProtocol {
    
    func players(atIndex indexPath: IndexPath) -> Roster? {
        if players.indices.contains(indexPath.row) {
            return players[indexPath.row]
        } else {
            return nil
        }
    }
    
    func viewDidLoad() {
        interactor.fetchPlayers()
    }
}

extension PlayersListPresenter: PlayersListInteractorOutputProtocol {
    
    func playersDidReceive(_ players: [Roster]) {
        self.players = players
        view.reloadData()
    }
}

