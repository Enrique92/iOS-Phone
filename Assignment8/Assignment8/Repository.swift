//
//  Repository.swift
//  Assignment8
//
//  Created by Enrique on 2019-05-08.
//  Copyright © 2019 Enrique. All rights reserved.
//

import Foundation

class Repository: Decodable {
    let id: Int
    let name: String
    let full_name: String
    let clone_url: String
    let created_at: Date
}
