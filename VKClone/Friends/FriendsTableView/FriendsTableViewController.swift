//
//  FriendsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 05.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }
    
    var nameSectionTitles = [String]()
    var filteredFriends: [Friend] = []
    
    let sortedFriends = Friend.getSortedFriends(from: friendNames)
    let friends = Friend.getFriends(from: friendNames)
    
    
    
    // Добавление UISearchController
    // https://www.raywenderlich.com/4363809-uisearchcontroller-tutorial-getting-started
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameSectionTitles = [String](sortedFriends.keys)
        nameSectionTitles = nameSectionTitles.sorted(by: { $0 < $1 })
        
        // Сообщает об изменении в UISearchBar.
        searchController.searchResultsUpdater = self
        // Вывод результата поиска в этот же view controller.
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Candies"
        // Добавление UISearchBar в navigationItem т.к Interface Builder не поддерживает UISearchController.
        navigationItem.searchController = searchController
        // UISearchBar не останется на экране, если пользователь на другой view controller.
        definesPresentationContext = true
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if isFiltering {
            return 1
        }
            return nameSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredFriends.count
        }
        let nameKey = nameSectionTitles[section]
        if let nameValue = sortedFriends[nameKey] {
            return nameValue.count
        }
        return 0
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        nameSectionTitles.count
//    }
//
        
        
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    let nameKey = nameSectionTitles[section]
//
//        if let nameValue = sortedFriends[nameKey] {
//            return nameValue.count
//        }
//
//        return 0
//    }
    
        
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
//        cell.configure(for: sortedFriends, nameSectionTitles: nameSectionTitles, indexPath: indexPath)
//
//        return cell
//    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendCell", for: indexPath) as! FriendViewCell
        
        if isFiltering {
            cell.configureFromArray(for: filteredFriends, indexPath: indexPath)
        } else {
            cell.configureFromDictionary(for: sortedFriends, nameSectionTitles: nameSectionTitles, indexPath: indexPath)
        }
        
        //cell.configureFromDictionary(for: sortedFriends, nameSectionTitles: nameSectionTitles, indexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Table view delegate
        
        // For ViewCollection
//        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//            let nameKey = nameSectionTitles[indexPath.section]
//            if  let nameValues = sortedFriends[nameKey] {
//
//
//            let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionViewControllerKey") as! PhotoCollectionViewController
//
//            FriendsPhotoCollectionVC.myFriend = nameValues[indexPath.row]
//
//            show(FriendsPhotoCollectionVC, sender: nil)
//            }
//
//        }
    
    // For Animated ImageView Lesson8
    // didSelectRowAt without UISearchBar
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//            let nameKey = nameSectionTitles[indexPath.section]
//            if  let friends = sortedFriends[nameKey] {
//
//            let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionVCKey") as! AnimatedGalleryViewController
//
//            FriendsPhotoCollectionVC.myFriend = friends[indexPath.row]
//
//            show(FriendsPhotoCollectionVC, sender: nil)
//            }
//        }
    
    
    // didSelectRowAt for UISearchBar.
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering {
            //let friend = filteredFriends[indexPath.row]
            let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionVCKey") as! AnimatedGalleryViewController
            FriendsPhotoCollectionVC.myFriend = filteredFriends[indexPath.row]
            show(FriendsPhotoCollectionVC, sender: nil)
        } else {
            
            let nameKey = nameSectionTitles[indexPath.section]
            if  let friends = sortedFriends[nameKey] {
                
                let FriendsPhotoCollectionVC = storyboard?.instantiateViewController(withIdentifier: "PhotoCollectionVCKey") as! AnimatedGalleryViewController
                
                FriendsPhotoCollectionVC.myFriend = friends[indexPath.row]
                
                show(FriendsPhotoCollectionVC, sender: nil)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return nameSectionTitles
    }
    
    
    func filterContentForSearchText(_ searchText: String) {
      filteredFriends = friends.filter { (friend: Friend) -> Bool in
        return friend.name.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
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

extension FriendsTableViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
  }
}
