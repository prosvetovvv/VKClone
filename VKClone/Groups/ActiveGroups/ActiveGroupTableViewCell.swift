//
//  ActiveGroupTableViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 06.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class ActiveGroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageActiveGroup: UIImageView!
    
    
    @IBOutlet weak var nameActiveGroup: UILabel!
    
    @IBOutlet weak var descriptionActiveGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageActiveGroup.layer.cornerRadius = imageActiveGroup.frame.size.height / 2
        imageActiveGroup.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure (for groups: [Group], indexPath: IndexPath) {
        
        nameActiveGroup.text =  groups[indexPath.row].name
        descriptionActiveGroup.text = (groups[indexPath.row].description)
        imageActiveGroup.image = UIImage(named: groups[indexPath.row].image)
        
    }
    
}
