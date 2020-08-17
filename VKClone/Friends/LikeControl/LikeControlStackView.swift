//
//  LikeControlStackView.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 12.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

@IBDesignable class LikeControlStackView: UIStackView {
    
    // MARK:- Properties
    
    private var likeButtons = [UIButton]()
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    // MARK:- Initialization
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupButtons()
        
    }
    
    required init(coder: NSCoder) {
        
        super.init(coder: coder)
        
        setupButtons()
        
        //fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Button Action
    
    @objc func likeButtonTapped(button: UIButton) {
        guard let index = likeButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(likeButtons)")
        }
        
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    // MARK:- Private Methods
    
    private func setupButtons() {
        
        // Clean any existing buttons
        
        for button in likeButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        likeButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // Create button
        
        for _ in 0..<starCount {
            
            let button = UIButton()
            //button.backgroundColor = .red
            
            // Set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            
            button.addTarget(self, action: #selector(likeButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            
            likeButtons.append(button)
            
        }
        
        updateButtonSelectionStates()
        
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in likeButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
}
