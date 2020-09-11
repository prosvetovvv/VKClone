//
//  CustomPushAnimator.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 09.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    // Длительность анимации
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        // Получение текущего и следующего view controller.
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        // Добавление следующего view controller в контейнер
        transitionContext.containerView.addSubview(destination.view)
        // Задание начального frame для следующего view controller.
        destination.view.frame = source.view.frame
        
        // Для текущего view controller Anchor point устанавливается в верхний левый угол.
        source.view.setAnchorPoint(CGPoint(x: 0, y: 0))
        // Для следующего view controller Anchor point устанавливается в верхний правый угол.
        destination.view.setAnchorPoint(CGPoint(x: 1, y: 0))
        //destination.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        destination.view.transform = CGAffineTransform(rotationAngle: -.pi / 2)
        
        
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    // Удаляется текущий view controller.
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let translation = CGAffineTransform(rotationAngle: .pi / 2)
                                                        source.view.transform = translation
                                    })
                                    
                                    // Появляется следующий view controller.
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        let translation = CGAffineTransform(rotationAngle: .pi + .pi)
                                                        destination.view.transform = translation
                                    })
                                    // Следующий view controller полностью открывается.
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        destination.view.transform = .identity
                                    })
        }) { finished in
            // Если анимация закончена, текущему view controller возвращается прежняя transform.
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
        }
        
    }
    
}

// Метод для изменения Anchor point без сдвига самого view controller.
// https://www.hackingwithswift.com/example-code/calayer/how-to-change-a-views-anchor-point-without-moving-it

extension UIView {
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}
