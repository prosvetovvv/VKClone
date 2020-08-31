//
//  ActiveGroupTableViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 06.08.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class ActiveGroupsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return groups.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActiveGroupsCell", for: indexPath) as! ActiveGroupTableViewCell
        
        cell.configure(for: groups, indexPath: indexPath)        
        
        return cell
    }
    
    // MARK: - Delete from table
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            newGroups.append(groups[indexPath.row])
            groups.remove(at: indexPath.row)            
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }
    }
    
}

