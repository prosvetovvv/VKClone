//
//  FriendsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    let friends = Friend.getFriends()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Appear and Disappear settings
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
        
        cell.configure(for: friends, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        
    //        let vc = storyboard?.instantiateViewController(withIdentifier: "FriendsPhotoCollectionViewKey") as! FriendsPhotoCollectionViewController
    //        
    //        show(vc, sender: nil)
    //        
    //    }
    
    
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showFriendPhoto" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vc = segue.destination as! FriendsPhotoCollectionViewController
                
                //vc.myFriendPhoto = friends[indexPath.row].image
                vc.myFriend = friends[indexPath.row]
            }
        }
        
        
        
    }
    
    
}
