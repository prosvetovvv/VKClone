//
//  FriendViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

 class FriendViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var friendImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
   
    
   var shadowRadiusAvatar: CGFloat = 10.0 {
        didSet {
            settingShadowAvatar()
        }
    }
    
    var shadowColorAvatar = UIColor.black.cgColor {
        didSet {
            settingShadowAvatar()
        }
    }
    
    var shadowOpacityAvatar: Float = 0.5 {
        didSet {
            settingShadowAvatar()
        }
    }
    
    
    
    private func settingShadowAvatar() {
        let cornerRadius = containerView.frame.size.height / 2
    //conteinerView.layer.cornerRadius = conteinerView.frame.size.height / 2
    
    containerView.backgroundColor = .clear
    containerView.layer.shadowPath = UIBezierPath(roundedRect: friendImageView.bounds, cornerRadius: cornerRadius).cgPath
    
    containerView.layer.shadowRadius = shadowRadiusAvatar
    containerView.layer.shadowColor = shadowColorAvatar
    containerView.layer.shadowOffset = CGSize.zero
    containerView.layer.shadowOpacity = shadowOpacityAvatar
        
    }
    
    override func awakeFromNib() {
        
         let cornerRadius = friendImageView.frame.size.height / 2
    
        friendImageView.layer.cornerRadius = cornerRadius
        friendImageView.layer.masksToBounds = true
        
        settingShadowAvatar()
        
    }
    
    func configure (for friends: [Friend], indexPath: IndexPath) {
        nameLabel.text =  friends[indexPath.row].name
        ageLabel.text = "\(friends[indexPath.row].age)"
        birthdayLabel.text = (friends[indexPath.row].birthday)
        friendImageView.image = UIImage(named: friends[indexPath.row].image)
    }
}
