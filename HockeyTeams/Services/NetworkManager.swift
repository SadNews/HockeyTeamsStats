//
//  NetworkManager.swift
//  HockeyTeams
//
//  Copyright © 2020 UshakovAndrey. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static var shared = NetworkManager()
    
    func playersDataParse(from teamID: Int, with finished: @escaping ([Roster]) -> ()) {
        
        AF.request("https://statsapi.web.nhl.com/api/v1/teams/\(teamID)/roster")
            .validate()
            .responseDecodable(of: PlayersData.self) { (response) in
                switch response.result{
                case .success(let playerData):
                    finished(playerData.roster)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func teamsDataParse(finished: @escaping ([Teams]) -> ()) {
        
        AF.request("https://statsapi.web.nhl.com/api/v1/teams")
            .validate()
            .responseDecodable(of: TeamsData.self) { (response) in
                switch response.result{
                case .success(let teams):
                    finished(teams.teams)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func stateParse(finished: @escaping ([Records]) -> ()) {
        AF.request("https://statsapi.web.nhl.com/api/v1/standings")
            .validate()
            .responseDecodable(of: StatsParse.self) { (response) in
                switch response.result{
                case .success(let stats):
                    finished((stats.records ?? nil)!)
                case .failure(let error):
                    print(error)
                }
        }
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void) {
           AF.request(urlString)
               .validate()
               .responseDecodable(of: T.self) { (response) in
                   switch response.result{
                   case .success(let result):
                    completion(result)
                    print(result)
                   case .failure(let error):
                       print(error)
                   }
           }
    }
}
