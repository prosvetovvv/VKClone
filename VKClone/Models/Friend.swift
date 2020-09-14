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
    
    static func getFriends(from array: [[[String]]]) -> [Friend] {
        
        var friends = [Friend]()
        
        for friend in array {
            
            friends.append(Friend(image: friend[0][0], name: friend[0][0], age: 34, birthday: "10.11.1985", photo: friend[1]))            
        }
        
        return friends
    }
    
    static func getSortedFriends(from array: [[[String]]]) -> [String: [Friend]] {
        
        //var friends = [Friend]()
        var namesDictionary = [String: [Friend]]()
        //var namesSectionTitles = [String]()
        
        for friend in array {
            
            let nameKey = String(friend[0][0].prefix(1))
            if var nameValues = namesDictionary[nameKey] {
                nameValues.append(Friend(image: friend[0][0], name: friend[0][0], age: 34, birthday: "10.11.1985", photo: friend[1]))
                namesDictionary[nameKey] = nameValues
            } else {
                namesDictionary[nameKey] = [Friend(image: friend[0][0], name: friend[0][0], age: 34, birthday: "10.11.1985", photo: friend[1])]
            }
        }
        
        
        //        namesSectionTitles = [String](namesDictionary.keys)
        //        namesSectionTitles = namesSectionTitles.sorted(by: { $0 < $1 })
        
        
        return namesDictionary
    }
}
