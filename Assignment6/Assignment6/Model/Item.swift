//
//  ToDo.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-01.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class Item {
    var name: String
    var priority: ItemPriority
    
    init (name: String) {
        self.name = name
        self.priority = .NormalPriority()
    }
}


