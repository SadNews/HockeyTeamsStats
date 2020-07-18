//
//  TeamsStatsPresentor.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 10.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

protocol TeamsStatsPresenterProtocol: class {
    var eastRecords: [TeamRecords] {get}
    var westRecords: [TeamRecords] {get}
    var westAndEastRecords: [TeamRecords] {get}
    var eastRecordCount: Int? {get}
    var westRecordCount: Int? {get}
    var westAndEastCount: Int? {get}
    var teams: [Teams] {get}
    func viewDidLoad()
    func stats(atIndex IndexPath: IndexPath) -> TeamRecords?
}

class TeamsStatsPresenter {
    
    weak var view: TeamsStatsViewProtocol!
    var interactor: TeamsStatsInteractorProtocol!
    var router: TeamsStatsRouterProtocol!
    
    var eastRecords: [TeamRecords] = []
    var westRecords: [TeamRecords] = []
    var westAndEastRecords: [TeamRecords] = []
    var teams: [Teams] = []
    var eastRecordCount: Int? {
        eastRecords.count
    }
    var westRecordCount: Int? {
        westRecords.count
    }
    var westAndEastCount: Int? {
        westAndEastRecords.count
    }
    
    required init(view: TeamsStatsViewProtocol) {
        self.view = view
    }
}

extension TeamsStatsPresenter: TeamsStatsPresenterProtocol {
    func stats(atIndex indexPath: IndexPath) -> TeamRecords? {
        if eastRecords.indices.contains(indexPath.row) {
            return eastRecords[indexPath.row]
        }else if westRecords.indices.contains(indexPath.row){
            return westRecords[indexPath.row]
        }else if westAndEastRecords.indices.contains(indexPath.row){
            return westAndEastRecords[indexPath.row]
        }
        else {
            return nil
        }
    }
    
    func viewDidLoad() {
        if !CheckInternet.Connection(){
            view.alert(Message: "No internet connection")
        }else {
            interactor.fetchTeams()
            
            interactor.fetchStats()
        }
    }
}

extension TeamsStatsPresenter: TeamsStatsInteractorOutputProtocol {
    func teamsStatsDidReceive(_ stats: [Records]) {
        self.eastRecords = stats[0].teamRecords! + stats[1].teamRecords!
        self.westRecords = stats[2].teamRecords! + stats[3].teamRecords!
        self.westAndEastRecords = eastRecords + westRecords
        eastRecords = eastRecords.sorted(by: {$0.points! > $1.points!})
        westRecords = westRecords.sorted(by: {$0.points! > $1.points!})
        westAndEastRecords = westAndEastRecords.sorted(by: {$0.points! > $1.points!})
        view.reloadData()
    }
    
    func teamsDidReceive(_ teams: [Teams]) {
        self.teams = teams
    }
}
