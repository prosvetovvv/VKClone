//
//  NewGroupsTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 07.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class NewGroupsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Appear and Disappear settings
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        self.navigationController?.isNavigationBarHidden = false
    //    }
    //
    //    override func viewWillDisappear(_ animated: Bool) {
    //        super.viewWillDisappear(animated)
    //        self.navigationController?.isNavigationBarHidden = true
    //    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGroups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupsCell", for: indexPath) as! NewGroupsTableViewCell
        cell.configure(for: newGroups, indexPath: indexPath)
        
        return cell
        
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedGroup = newGroups[indexPath.row]
        
        if  !groups.contains(where: {$0.name == selectedGroup.name}) {            
            
            groups.append(selectedGroup)
            newGroups.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        
    }
    
}
