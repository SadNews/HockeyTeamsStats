//
//  JsonTeams.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation

struct TeamsData: Decodable {
    var teams: [Teams]
}

struct Teams: Decodable {
    var id: Int?
    var name: String?
    var link: String?
    var venue: Venue?
    var firstYearOfPlay: String?
    var officialSiteUrl: String?
}

struct Venue: Decodable {
    var name: String?
    var city: String?
}
