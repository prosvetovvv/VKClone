//
//  CustomNavigationController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 09.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    let interactiveTransition = CustomInteractiveTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            if operation == .push {
                self.interactiveTransition.viewController = toVC
                return CustomPushAnimator()
            } else if operation == .pop {
                if navigationController.viewControllers.first != toVC {
                    self.interactiveTransition.viewController = toVC
                }
                return CustomPopAnimator()
            }
            return nil
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: UIViewControllerAnimatedTransitioning)
        -> UIViewControllerInteractiveTransitioning? {
            return interactiveTransition.hasStarted ? interactiveTransition : nil
    }
}
