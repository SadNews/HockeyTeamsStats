//
//  TeamsListPresentor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 07.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsListPresenterProtocol: class {
    
    var teams: [Teams] {get}
    var filterSearch: [Teams] {get set}
    var teamsCount: Int? {get}
    func viewDidLoad()
    func teams(atIndex IndexPath: IndexPath) -> Teams?
    func showTeamsDetails(for indexPath: IndexPath)
    
}

class TeamsListPresenter {
    
    weak var view: TeamsListViewProtocol!
    var interactor: TeamsListInteractorProtocol!
    var router: TeamsListRouterProtocol!
    
    var teams: [Teams] = []
    var filterSearch: [Teams] = []
    var teamsCount: Int? {
        teams.count
    }
    
    required init(view: TeamsListViewProtocol) {
        self.view = view
    }
}

extension TeamsListPresenter: TeamsListPresenterProtocol {
    func showTeamsDetails(for indexPath: IndexPath) {
        if teams.indices.contains(indexPath.row) {
            let team = teams[indexPath.row]
            router.openTeamsDetailViewController(with: team)
        }
    }
    
    func teams(atIndex indexPath: IndexPath) -> Teams? {
        if teams.indices.contains(indexPath.row) {
            return teams[indexPath.row]
        } else {
            return nil
        }
    }
    
    func viewDidLoad() {
        interactor.fetchTeams()
    }
}

extension TeamsListPresenter: TeamsListInteractorOutputProtocol {
    func teamsDidReceive(_ teams: [Teams]) {
        self.teams = teams
        view.reloadData()
    }
}
