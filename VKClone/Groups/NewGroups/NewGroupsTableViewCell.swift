//
//  NewGroupsTableViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 07.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class NewGroupsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageNewGroup: UIImageView!
    @IBOutlet weak var nameNewGroup: UILabel!
    @IBOutlet weak var descriptionNewGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageNewGroup.layer.cornerRadius = imageNewGroup.frame.size.height / 2
        imageNewGroup.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure (for groups: [NewGroup], indexPath: IndexPath) {
        
        nameNewGroup.text =  groups[indexPath.row].name
        descriptionNewGroup.text = (groups[indexPath.row].description)
        imageNewGroup.image = UIImage(named: groups[indexPath.row].image)
        
    }
    
}
