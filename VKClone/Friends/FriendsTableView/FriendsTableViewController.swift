//
//  FriendsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friends = Friend.getFriends(from: friendNames)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
        cell.configure(for: friends, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedIndex = indexPath.row
        let selectedFriend = selectedIndex
        let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionViewControllerKey") as! PhotoCollectionViewController
        
        FriendsPhotoCollectionVC.myFriend = friends[selectedFriend]
        
        show(FriendsPhotoCollectionVC, sender: nil)
        
    }
    
    // MARK: - Navigation segue
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //
    //        if segue.identifier == "showFriendPhoto" {
    //            if let indexPath = self.tableView.indexPathForSelectedRow {
    //                let vc = segue.destination as! FriendsPhotoCollectionViewController
    //
    //                //vc.myFriendPhoto = friends[indexPath.row].image
    //                vc.myFriend = friends[indexPath.row]
    //            }
    //        }
    //
    //
    //
    //    }
    
}
