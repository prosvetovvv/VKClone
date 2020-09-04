//
//  NewsViewController.swift
//  VKClone
//
//  Created by Vitaly Prosvetov on 02.09.2020.
//  Copyright © 2020 Vitaly Prosvetov. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let newsCellKey = "NewTableViewCellKey"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "NewsTableViewCell" , bundle: nil), forCellReuseIdentifier: newsCellKey)
    }
    
   
}


extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellKey, for: indexPath) as! NewsTableViewCell
        //cell.backgroundColor = .brown
        //cell.label?.text = "HELLO"
        cell.configure(for: news, indexPath: indexPath)
        return cell
    }
    
    
}
