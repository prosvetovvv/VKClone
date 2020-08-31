//
//  LikeUIControl.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 13.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

@IBDesignable class LikeUIControl: UIControl {
    
    private var stackView = UIStackView()
    private var elementsOfStackView: [UIView] = []
    private var buttonLike = UIButton()
    let labelCount = UILabel()
    
    var boo = false
    
    
    private var countLike = 0
        
    // MARK:- Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.setupStackView()
        self.createLikeButton()
        self.createLabelCount()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .clear
        //self.setupStackView()
        self.createLikeButton()
        self.createLabelCount()
        self.setupStackView()
    }
    
    
    // MARK:- Button Action
    
    @objc func likeButtonTapped(button: UIButton) {
        
        if buttonLike.isSelected {
            buttonLike.isSelected.toggle()
            countLike -= 1
            labelCount.text = "\(countLike)"
        } else {
            buttonLike.isSelected.toggle()
            countLike += 1
            labelCount.text = "\(countLike)"
           
        }
    }
    
    // MARK:- Private Methods
    
    private func setupStackView() {
                
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
    }
    
    private func createLabelCount() {
        
        labelCount.textAlignment = .left
        labelCount.text = "\(countLike)"
        labelCount.textColor = .white
        labelCount.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        

        elementsOfStackView.append(labelCount)
        
        stackView.addArrangedSubview(labelCount)
    }
    

    private func createLikeButton() {

        let configWight = UIImage.SymbolConfiguration(pointSize: 18.0, weight: .medium)
        let emptyHeart = UIImage(systemName: "heart", withConfiguration: configWight)
        let fillHeart = UIImage(systemName: "heart.fill", withConfiguration: configWight)
    
        buttonLike.setImage(emptyHeart, for: .normal)
        buttonLike.setImage(fillHeart, for: .selected)
        buttonLike.tintColor = .white
        
        buttonLike.addTarget(self, action: #selector(likeButtonTapped(button:)), for: .touchUpInside)
                
        elementsOfStackView.append(buttonLike)
        
        stackView.addArrangedSubview(buttonLike)

    }
    
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
    stackView.frame = bounds
        
    }
    

}
