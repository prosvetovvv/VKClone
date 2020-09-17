//
//  FriendsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var nameSectionTitles = [String]()
    
    let sortedFriends = Friend.getSortedFriends(from: friendNames)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameSectionTitles = [String](sortedFriends.keys)
        nameSectionTitles = nameSectionTitles.sorted(by: { $0 < $1 })
        
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameSectionTitles
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return nameSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let nameKey = nameSectionTitles[section]
        if let nameValue = sortedFriends[nameKey] {
            return nameValue.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
        cell.configureFromDictionary(for: sortedFriends, nameSectionTitles: nameSectionTitles, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    // For Animated ImageView Lesson8
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let nameKey = nameSectionTitles[indexPath.section]
        if  let friends = sortedFriends[nameKey] {
            
            let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionVCKey") as! AnimatedGalleryViewController
            
            FriendsPhotoCollectionVC.myFriend = friends[indexPath.row]
            
            show(FriendsPhotoCollectionVC, sender: nil)
        }
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

