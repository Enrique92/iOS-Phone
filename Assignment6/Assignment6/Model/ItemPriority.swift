//
//  ItemPriority.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-08.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ItemPriority {
    var typePriority: String
    var items: [Item]
    
    init(includePriority: [Item]) {
        typePriority = ""
        items = includePriority
    }
    
    init(prio: String, includePriority: [Item]) {
        typePriority = prio
        items = includePriority
    }
    
    class func getPriorityItems() -> [ItemPriority] {
        // Add the priorities
        return [HighPriority(), NormalPriority(), LowPriority()]
    }
    
    class func getPriorityNormal() -> [ItemPriority] {
        // Add the normal Priority
        return [NormalPriority()]
    }
    
    class func HighPriority() -> ItemPriority {
        var itemsHighPrio = [Item]()
        
        return ItemPriority(prio: "High", includePriority: itemsHighPrio)
    }
    
    class func NormalPriority() -> ItemPriority {
        var itemsNormalPrio = [Item]()
        
        return ItemPriority(prio: "Normal", includePriority: itemsNormalPrio)
    }
    
    class func LowPriority() -> ItemPriority {
        var itemsLowPrio = [Item]()
        
        return ItemPriority(prio: "Low", includePriority: itemsLowPrio)
    }
}
