//
//  NewTableViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 01.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var likeControl: LikeUIControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatar.layer.cornerRadius = avatar.frame.size.height / 2
        avatar.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
    
    func configure(for news: [News], indexPath: IndexPath) {
        
        avatar.image = UIImage(named: news[indexPath.row].image)
        name.text = news[indexPath.row].name
        date.text = news[indexPath.row].dateOfNews
        newsText.text = news[indexPath.row].textNews
        photo.image = UIImage(named: news[indexPath.row].photo)
        
    }

}
