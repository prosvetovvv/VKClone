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
    private var countLike = 0 {
        didSet {
            createLabelCount()
        }
    }
    
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupStackView()
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
            buttonLike.isSelected = false
            countLike -= 1
        } else {
            buttonLike.isSelected = true
            countLike += 1
           
            //buttonLike.setImage(UIImage(named: "filledStar", for: .selected)
        }
    
    }
    
    // MARK:- Private Methods
    
    private func setupStackView() {
                
        stackView.spacing = 0
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        //stackView = UIStackView(arrangedSubviews: self.elementsOfStackView)
        
        self.addSubview(stackView)
        
    }
    
    private func createLabelCount() {
        
        stackView.removeArrangedSubview(labelCount)
        
        //labelCount.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        labelCount.textAlignment = .center //For center alignment
        labelCount.text = "\(countLike)"
        //labelCount.textColor = .white
        //labelCount.backgroundColor = .lightGray//If required
        labelCount.font = UIFont.systemFont(ofSize: 20)

        elementsOfStackView.append(labelCount)
        
        stackView.addArrangedSubview(labelCount)
    }
    

    private func createLikeButton() {
        //let buttonLike = UIButton()
        
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        buttonLike.setImage(emptyStar, for: .normal)
        buttonLike.setImage(filledStar, for: .selected)
        buttonLike.setImage(highlightedStar, for: .highlighted)
        buttonLike.setImage(highlightedStar, for: [.highlighted, .selected])
        
        buttonLike.addTarget(self, action: #selector(likeButtonTapped(button:)), for: .touchUpInside)
                
        elementsOfStackView.append(buttonLike)
        
        stackView.addArrangedSubview(buttonLike)

    }
    
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
    stackView.frame = bounds
        
    }
    

}
