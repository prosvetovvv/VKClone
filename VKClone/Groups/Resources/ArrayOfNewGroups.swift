//
//  ArrayOfNewGroups.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 11.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

let newGroupsNames = [
    ["Горные лыжи", "Спорт"],
    ["Банный клуб", "Баня"],
    ["Mountain bike", "Спорт"]
]

var newGroups = Group.getGroups(from: newGroupsNames)
