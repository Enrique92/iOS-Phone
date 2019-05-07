//
//  NetworkService.swift
//  AppStore
//
//  Created by Enrique on 2019-05-06.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation

// Singleton (One instance only)

class NetworkService {
    // Static field
    static let shared = NetworkService()
    
    private init() {}
    
    public func fetchSearchResult(_ term: String?, _ completion: @escaping ([SearchResultApp], Error?) -> ()) {
        guard let urlStr = term else {
            return
        }
        // 1. url
        let url = URL(string: "https://itunes.apple.com/search?term=\(urlStr)&entity=software")
        
        // 2. request
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if let err = error {
                print("Failed to fetch apps: ", err)
                completion([], err)
                return
            }
            
            guard let data = data else {
                return
            }
            do {
                let searchResult = try JSONDecoder().decode(SearchResultApp.self, from: data)
                completion(searchResult.results, nil)
            } catch let jsonError {
                completion([], jsonError)
                print("Failed to decode JSON", jsonError)
            }
            }.resume() // fires!
        
        // 3. parse response
    }
}

