//
//  avatarWithShadow.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 17.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

@IBDesignable class avatarWithShadow: UIView {
    
    var avatarImageView = UIImageView()
    
    private var sizeAvatar = CGSize(width: 65.0, height: 65.0)
    
    private var cornerRadius: CGFloat {
        get { return sizeAvatar.height / 2 }
    }
    
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            self.layer.shadowColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowRadius: Double {
        get {
            return Double(self.layer.shadowRadius)
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    
    
    // MARK:- Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame.size = sizeAvatar
        self.backgroundColor = .lightText
        addAvatarView()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        addAvatarView()
        
    }
    
    // MARK:- Private methods
    
    private func addAvatarView() {
        
        avatarImageView.frame.size = sizeAvatar
        avatarImageView.layer.cornerRadius = cornerRadius
        avatarImageView.layer.masksToBounds = true
        
        addSubview(avatarImageView)
        
    }
    
    func addImage(image: UIImage?) {
        
        if let image = image {
            avatarImageView.image = image
        } else {
            avatarImageView.image = UIImage(named: "И1")
        }
    }
    
}
