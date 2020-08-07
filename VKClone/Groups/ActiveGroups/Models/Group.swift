//
//  Group.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 06.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

struct Group {
    let image: String
    let name: String
    let description: String
    
    
    static let groupsNames = [
        ["Любители Ferrari", "Авто"],
        ["Поймай Марлина", "Рыбалка"],
        ["Жители Москвы", "Города"],
        ["Готовим стейки", "Еда"],
        ["Craft beer", "Пиво"],
        ["Swift", "Программирование"],
        ["BMW Club", "Авто"],
        ["Radio cars", "Хобби"]
    ]
    
    static func getGroups() -> [Group] {
        
        var groups = [Group]()
        
        for group in groupsNames {
            groups.append(Group(image: group[0], name: group[0], description: group[1]))
        }
        
        return groups
    }
}
