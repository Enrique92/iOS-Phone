//
//  ViewController.swift
//  Assignment8
//
//  Created by Enrique on 2019-05-07.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let reuseIdentifier = "repo"
    var repos: [Repository] = [Repository]()
    private let refreshController = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        // Refresh controll
        // tableView.addSubview(refreshController)
        // New way to add your refreshControll
        tableView.refreshControl = refreshController
        refreshController.addTarget(self, action: #selector(refreshRepos), for: .valueChanged)
        
        getRepositories("Enrique92")
    }
    
    @objc func refreshRepos() {
        getRepositories("Enrique92")
    }
    
    private func getRepositories(_ username: String) {
        guard let url = URL(string: "https://api.github.com/users/\(username)/repos") else {
            return
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) {(data, response, err) in
            
            if let err = err {
                print("Error \(err)")
                return
            }
            
            if let data = data {
                do {
                    // Decoding the date
                    let decoder = JSONDecoder()
                    // 2014-10-10T04:50:40Z
                    decoder.dateDecodingStrategy = .iso8601
                    self.repos = try decoder.decode([Repository].self, from: data)
                    
                    DispatchQueue.main.sync {
                        // Reload the data from the tableView
                        self.tableView.reloadData()
                        
                        // End refreshing the controller
                        self.refreshController.endRefreshing()
                    }
                    print(data)
                } catch {
                    debugPrint("Error \(error)")
                }
            }
            }.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // Set the Date
        let date = self.repos[indexPath.row].created_at
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        cell.detailTextLabel?.text = dateFormatter.string(from: date)
        
        cell.textLabel!.text = repos[indexPath.row].name
        //cell.detailTextLabel?.text = repos[indexPath.row].created_at.description
        
        return cell
    }
    
}
