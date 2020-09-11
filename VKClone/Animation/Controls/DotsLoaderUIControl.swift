//
//  dotLoadUIControl.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 03.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

@IBDesignable class DotsLoaderUIControl: UIControl {
    
    private let dot = CALayer()
    private let numberDots = 3
    private var dotSize = CGRect(x: 0, y: 0, width: 16, height: 16)
    
    @IBInspectable var colorDot: UIColor? {
        get {
            return UIColor(cgColor: dot.backgroundColor!)
        }
        set {
            dot.backgroundColor = newValue?.cgColor
        }
    }
    
    // MARK:- Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createDotsLoader()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        createDotsLoader()
        
    }
    
    
    // MARK:- Create Dots Loader
    
    private func createDotsLoader() {        
        
        let layerReplicator = CAReplicatorLayer()
        layerReplicator.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        dot.frame = dotSize
        dot.cornerRadius = dotSize.height / 2
        
        layerReplicator.addSublayer(dot)
        layerReplicator.instanceCount = numberDots
        layerReplicator.instanceTransform = CATransform3DMakeTranslation(24, 0, 0)
        
        let animate = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animate.fromValue = 1.0
        animate.toValue = 0.2
        animate.duration = 1
        animate.repeatCount = .infinity
        
        dot.add(animate, forKey: nil)
        layerReplicator.instanceDelay = animate.duration / Double(layerReplicator.instanceCount)
        
        self.layer.addSublayer(layerReplicator)
    }
    
}
