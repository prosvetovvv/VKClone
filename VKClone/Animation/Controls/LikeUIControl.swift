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
    private let labelCount = UILabel()
    private var countLike = 0
    
    @IBInspectable var colorHeart: UIColor? {
        get {
            return buttonLike.tintColor
        }
        set {
            buttonLike.tintColor = newValue
        }
    }
    
    @IBInspectable var colorCount: UIColor? {
        get {
            return labelCount.textColor
        }
        set {
            labelCount.textColor = newValue
        }
    }
    
    
    
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

        self.createLikeButton()
        self.createLabelCount()
        self.setupStackView()
    }
    
    
    // MARK:- Button Action
    
    @objc func likeButtonTapped(button: UIButton) {
        
        if buttonLike.isSelected {
            animateLikeButton()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.countLike -= 1
                self.buttonLike.isSelected.toggle()
                self.labelCount.text = "\(self.countLike)"
            }
        } else {
            animateLikeButton()
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
        labelCount.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        
        stackView.addArrangedSubview(labelCount)
    }
    
    
    private func createLikeButton() {
        
        let configWight = UIImage.SymbolConfiguration(pointSize: 18.0, weight: .medium)
        let emptyHeart = UIImage(systemName: "heart", withConfiguration: configWight)
        let fillHeart = UIImage(systemName: "heart.fill", withConfiguration: configWight)
        
        buttonLike.setImage(emptyHeart, for: .normal)
        buttonLike.setImage(fillHeart, for: .selected)
        buttonLike.addTarget(self, action: #selector(likeButtonTapped(button:)), for: .touchUpInside)
        
        stackView.addArrangedSubview(buttonLike)
        
    }
    
    private func animateLikeButton() {
        
        UIView.animate(withDuration: 0.1,
        animations: { [weak self] in
            self?.buttonLike.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            
        },
        completion: { _ in
            UIView.animate(withDuration: 0.1) { [weak self] in
                self?.buttonLike.transform = CGAffineTransform.identity
            }
        })
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        stackView.frame = bounds
        
    }
    
    
}
