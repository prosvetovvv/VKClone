//
//  PhotoCollectionViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 12.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UIViewController {
    
    var myFriend: Friend?
    private let reuseIdentifier = "PhotoCollectionViewCellKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}


// MARK:- View collection DataSource
   
extension PhotoCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let selectedFriend = myFriend else { return 0 }
        return selectedFriend.photo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
        
        cell.photo.image = UIImage(named: myFriend!.photo[indexPath.row])
        
        return cell
}

}
