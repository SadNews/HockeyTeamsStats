//
//  StatsParse.swift
//  HockeyTeams
//
//  Created by Андрей Ушаков on 14.05.2020.
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

struct TeamsStats: Decodable {
    var records: [Records]?
}

struct Records: Decodable {
    var teamRecords: [TeamRecords]?
}

struct TeamRecords: Decodable {
    var team: Team?
    var leagueRecord: LeagueRecord?
    var regulationWins: Int?
    var goalsAgainst: Int?
    var goalsScored: Int?
    var points: Int?
    var divisionRank: String?
    var gamesPlayed: Int?
}

struct Team: Decodable {
    var name: String?
}

struct LeagueRecord: Decodable {
    var wins: Int?
    var losses: Int?
    var ot: Int?
}
