//
//  FriendViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendViewCell: UITableViewCell {
    
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func awakeFromNib() {        
        
        friendImageView.layer.cornerRadius = friendImageView.frame.size.height / 2
        friendImageView.clipsToBounds = true
    }
    
    func configure (for friends: [Friend], indexPath: IndexPath) {
        
        nameLabel.text =  friends[indexPath.row].name
        ageLabel.text = "\(friends[indexPath.row].age)"
        birthdayLabel.text = (friends[indexPath.row].birthday)
        friendImageView.image = UIImage(named: friends[indexPath.row].image)        
        
    }
}
