//
//  FriendViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

 class FriendViewCell: UITableViewCell {
    
    
    @IBOutlet weak var avatarWithShadow: AvatarWithShadow!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {
        
    }
        
    func configureFromDictionary(for friends: [String: [Friend]], nameSectionTitles: [String], indexPath: IndexPath) {
        
        let nameKey = nameSectionTitles[indexPath.section]
        if let nameValues = friends[nameKey] {
            let avatar = UIImage(named: nameValues[indexPath.row].image)
            
            avatarWithShadow.addImage(image: avatar)
            nameLabel.text = nameValues[indexPath.row].name
            ageLabel.text = "\(nameValues[indexPath.row].age)"
            birthdayLabel.text = (nameValues[indexPath.row].birthday)
        }
    }
    
    func configureFromArray(for friends: [Friend], indexPath: IndexPath) {
        let avatar = UIImage(named: friends[indexPath.row].image)

        avatarWithShadow.addImage(image: avatar)

        nameLabel.text =  friends[indexPath.row].name
        ageLabel.text = "\(friends[indexPath.row].age)"
        birthdayLabel.text = (friends[indexPath.row].birthday)

    }
}
