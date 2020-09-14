//
//  ArrayOfActiveGroups.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 11.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation


 let groupsNames = [
    ["Любители Ferrari", "Авто"],
    ["Поймай Марлина", "Рыбалка"],
    ["Жители Москвы", "Города"],
    ["Готовим стейки", "Еда"],
    ["Craft beer", "Пиво"],
    ["Swift", "Программирование"],
    ["BMW Club", "Авто"],
    ["Radio cars", "Хобби"]
]

var groups = Group.getGroups(from: groupsNames)
