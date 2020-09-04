//
//  NewsTableViewCell.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 02.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imagePhoto: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        imageAvatar.layer.cornerRadius = imageAvatar.frame.size.height / 2
        imageAvatar.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for news: [News], indexPath: IndexPath) {
        
        imageAvatar.image = UIImage(named: news[indexPath.row].image)
        labelName.text = news[indexPath.row].name
        labelDate.text = news[indexPath.row].dateOfNews
        labelText.text = news[indexPath.row].textNews
        imagePhoto.image = UIImage(named: news[indexPath.row].photo)
        
    }
    
}
