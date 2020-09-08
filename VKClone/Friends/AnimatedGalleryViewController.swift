//
//  AnimatedGalleryViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 07.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class AnimatedGalleryViewController: UIViewController {
    
    @IBOutlet weak var photo: UIImageView!
    
    var myFriend: Friend?
    
    var xZeroPositionImageView: CGFloat {
        return self.view.center.x
    }
    
    var widthImageView: CGFloat {
        return self.view.bounds.width
    }
    
    var offset: CGFloat {
        return self.view.bounds.width
    }
    
    var photoArray = [String]()
    var indexImage = 0
    let panGestureRecognizer = UIPanGestureRecognizer()
    var panGestureAnchorPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indexImage = 0
        
        print(xZeroPositionImageView)
        guard let photoArray = myFriend?.photo else { return }
        self.photoArray = photoArray
        
        panGestureRecognizer.addTarget(self, action: #selector(onPan(_:)))
        panGestureRecognizer.minimumNumberOfTouches = 1
        
        photo.image = UIImage(named: "\(photoArray[indexImage])")
        photo.addGestureRecognizer(panGestureRecognizer)
        
    }
    
    @objc func onPan(_ gestureRecognizer: UIPanGestureRecognizer) {
        
        let translation = gestureRecognizer.translation(in: view)
        
        guard let gestureView = gestureRecognizer.view else { return }
        
        switch gestureRecognizer.state {
            
        case .changed:
            
           
            gestureView.center.x += translation.x
            
            gestureRecognizer.setTranslation(.zero, in: view)
            
        case .ended:
            
            // Если фотка сдвинута влево меньше чем наполовину, возвращаем ее в центр экрана
            if gestureView.center.x > 0 && gestureView.center.x < offset {
                gestureView.center.x = xZeroPositionImageView
            }
            
            // Если фотка сдвинута влево больше чем наполовину, но она последняя в массиве, то возвращаем ее в центр экрана
            if gestureView.center.x < xZeroPositionImageView && indexImage + 1 == photoArray.count {
                gestureView.center.x = xZeroPositionImageView
            }
            
            // Если фотка сдвинута влево больше чем на половину, и она не последняя в массиве, то запускается анимация
            if gestureView.center.x < xZeroPositionImageView && indexImage + 1 < photoArray.count {
                
                indexImage += 1
                movePhotoLeft(photo: gestureView)
                
            }
            
            // Если фотка сдвинута вправо больше чем на половину и она не первая в массиве, то запускается анимация
            if gestureView.center.x > offset && indexImage < photoArray.count && indexImage > 0 {
                 
                indexImage -= 1
                movePhotoRight(photo: gestureView)
                
            }
            
            // Если фотка сдвинута вправо больше чем на половину и она первая в массиве, то возвращаем ее в центр экрана
            if gestureView.center.x > offset && indexImage == 0 {
                gestureView.center.x = xZeroPositionImageView
            }
    
        default: return
        }
        
    }
    
    func movePhotoLeft(photo: UIView) {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        photo.center.x -= self.offset
        },
                       completion: { _ in
                        photo.center.x = self.xZeroPositionImageView
                        self.photo.image = UIImage(named: "\(self.photoArray[self.indexImage])")
                        
        }
        )
    }
    
    func movePhotoRight(photo: UIView) {
        print(photo.center.x)
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                        photo.center.x += self.offset
                      
        },
                       completion: { _ in
                        print("after +: \(photo.center.x)")
                        photo.center.x = self.xZeroPositionImageView
                        self.photo.image = UIImage(named: "\(self.photoArray[self.indexImage])")
                        
        }
        )
    }
    
}
