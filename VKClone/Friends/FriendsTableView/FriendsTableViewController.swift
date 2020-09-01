//
//  FriendsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    //let friends = Friend.getFriends(from: friendNames)
    let sortedFriends = Friend.getSortedFriends(from: friendNames)
    
    var nameSectionTitles = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameSectionTitles = [String](sortedFriends.keys)
        nameSectionTitles = nameSectionTitles.sorted(by: { $0 < $1 })
        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        nameSectionTitles.count
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return friends.count
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nameKey = nameSectionTitles[section]
        if let nameValue = sortedFriends[nameKey] {
            return nameValue.count
        }
        
        return 0
    }
    
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
//        cell.configure(for: friends, indexPath: indexPath)
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
        cell.configure(for: sortedFriends, nameSectionTitles: nameSectionTitles, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let selectedIndex = indexPath.row
//        let selectedFriend = selectedIndex
//        let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionViewControllerKey") as! PhotoCollectionViewController
//
//        FriendsPhotoCollectionVC.myFriend = friends[selectedFriend]
//
//        show(FriendsPhotoCollectionVC, sender: nil)
//
//    }
    
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
           // let selectedIndex = indexPath.row
            //let selectedFriend = selectedIndex
            let nameKey = nameSectionTitles[indexPath.section]
            if  let nameValues = sortedFriends[nameKey] {
                
            
            let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionViewControllerKey") as! PhotoCollectionViewController
    
            FriendsPhotoCollectionVC.myFriend = nameValues[indexPath.row]
    
            show(FriendsPhotoCollectionVC, sender: nil)
            }
    
        }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameSectionTitles
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
