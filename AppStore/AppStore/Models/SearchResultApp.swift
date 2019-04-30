//
//  SearchResultApp.swift
//  AppStore
//
//  Created by Enrique on 2019-04-29.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation

struct SearchResultApp: Decodable {
    let resultCount: Int
    let results: [ResultsApp]
    
}

struct ResultsApp: Decodable {
    let trackName: String
    let primaryGenreName: String
}
