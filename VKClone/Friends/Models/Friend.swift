//
//  File.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import Foundation

struct Friend {
    
    var image: String
    var name: String
    var age: Int
    var birthday: String
    var photo: [String]
    
    //    static let friendNames = [
    //        "Иван Иванов",
    //        "Андрей Петров",
    //        "Richard Jackson",
    //        "Joanna Jones",
    //        "Анна Каренина",
    //        "Лена Маркина",
    //        "Марина Иванова"
    //    ]
    static let friendNames = [
        [["Иван Иванов"], ["И1", "И2", "И3"]],
        [["Андрей Петров"], ["И1", "И2", "И3"]],
        [["Richard Jackson"],["И1", "И2", "И3"]],
        [["Joanna Jones"], ["И1", "И2", "И3"]],
        [["Анна Каренина"], ["И1", "И2", "И3"]],
        [["Лена Маркина"], ["И1", "И2", "И3"]],
        [["Марина Иванова"], ["И1", "И2", "И3"]]
    ]
    
    static func getFriends() -> [Friend] {
        
        var friends = [Friend]()
        
        for friend in friendNames {
            //friends.append(Friend(image: friend, name: friend, age: 34, birthday: "10.11.1985"))
            //var fr = [String]()
            friends.append(Friend(image: friend[0][0], name: friend[0][0], age: 34, birthday: "10.11.1985", photo: friend[1]))
            
        }
        
        return friends
    }
}
