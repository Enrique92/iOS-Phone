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
    
    init(prio: String, includePriority: [Item]) {
        typePriority = prio
        items = includePriority
    }
    
    class func getPriorityItems() -> [ItemPriority] {
        // Add the priorities
        return [HighPriority(), NormalPriority(), LowPriority()]
    }
    
    private class func HighPriority() -> ItemPriority {
        let itemsHighPrio = [Item]()
        
        return ItemPriority(prio: "High", includePriority: itemsHighPrio)
    }
    
    private class func NormalPriority() -> ItemPriority {
        let itemsNormalPrio = [Item]()
        
        return ItemPriority(prio: "Normal", includePriority: itemsNormalPrio)
    }
    
    private class func LowPriority() -> ItemPriority {
        let itemsLowPrio = [Item]()
        
        return ItemPriority(prio: "Low", includePriority: itemsLowPrio)
    }
}
