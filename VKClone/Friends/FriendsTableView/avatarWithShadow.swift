//
//  avatarWithShadow.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 17.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

@IBDesignable class avatarWithShadow: UIView {
    
    let image =  UIImage()
    private var sizeAvatar = CGSize(width: 65.0, height: 65.0)
    private var cornerRadius: CGFloat {
        return sizeAvatar.height / 2
    }
    private var shadowColor = UIColor.black.cgColor
    private var shadowOpacity: Float = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        settingShadow()
        addAvatarView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        settingShadow()
        addAvatarView()
        
    }
    
    private func settingShadow() {
        
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        
        layer.shadowRadius = CGFloat(cornerRadius)
        layer.shadowRadius = 10
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = shadowOpacity
        
    }
    
    private func addAvatarView() {
        
        let avatarImageView = UIImageView()
        
        avatarImageView.frame.size = sizeAvatar
        //avatarImageView.image = UIImage(named: "И1")
        avatarImageView.image = image
        avatarImageView.layer.cornerRadius = cornerRadius
        avatarImageView.layer.masksToBounds = true
        
        addSubview(avatarImageView)
        
    }
    
}
