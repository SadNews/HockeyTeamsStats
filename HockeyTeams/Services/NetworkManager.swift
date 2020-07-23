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
    
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, finished: @escaping (T) -> Void) {
        AF.request(urlString)
            .validate()
            .responseDecodable(of: T.self) { (response) in
                switch response.result{
                case .success(let result):
                    print(result)
                    finished(result)
                case .failure(let error):
                    print(error)
                }
        }
    }
}
