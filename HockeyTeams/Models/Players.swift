//
//  PlayersData.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

struct PlayersData: Decodable {
    var roster: [Roster]
}

struct Roster: Decodable {
    var person: Person?
    var position: Position?
    var jerseyNumber: String?
}

struct Person: Decodable {
    var id: Int?
    var fullName: String?
}

struct Position: Decodable {
    var code: String?
    var name: String?
    var type: String?
    var abbreviation: String?
}

struct playersImage {
    var image: String?

}
