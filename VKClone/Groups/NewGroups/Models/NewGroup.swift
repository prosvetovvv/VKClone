//
//  NewGroup.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 07.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

struct NewGroup {
    
    let image: String
    let name: String
    let description: String
    
    
    static let groupsNames = [
        ["Горные лыжи", "Спорт"],
        ["Банный клуб", "Баня"],
        ["Mountain bike", "Спорт"]
    ]
    
    static func getNewGroups() -> [NewGroup] {
        
        var groups = [NewGroup]()
        
        for group in groupsNames {
            groups.append(NewGroup(image: group[0], name: group[0], description: group[1]))
        }
        
        return groups
    }
}
