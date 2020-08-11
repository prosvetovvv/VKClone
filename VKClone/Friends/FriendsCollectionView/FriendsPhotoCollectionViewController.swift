//
//  FriendsPhotoCollectionViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 06.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "FriendPhotoImageView"



class FriendsPhotoCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var friendPhoto: UIImageView!
    
    var myFriend: Friend?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let selectedFriend = myFriend else { return 0 }
        return selectedFriend.photo.count
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FriendsPhotoViewCell
        
        cell.friendPhoto.image = UIImage(named: myFriend!.photo[indexPath.row])
        
        return cell
    }
    
}
