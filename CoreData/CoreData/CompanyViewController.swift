//
//  CompanyViewController.swift
//  CoreData
//
//  Created by Enrique on 2019-05-14.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class CompanyViewController: UITableViewController {
    
    // MARK: - Constants
    private let reuseIdentifier = "companyCell"
    
    // MARK: - Properties
    var companies = ["Apple", "Google", "Microsoft", "Amazon", "Facebook"]
    
    // MARK: - Lifecyle method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightSpaceGray
        
        tableView.separatorColor = .white
        navigationItem.title = "Company List"
    }
    
    // MARK: - Helper method
    fileprivate func setupRightAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateAtCompany))
    }
    
    @objc func navigateAtCompany() {
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        cell.textLabel?.text = companies[indexPath.row]
        
        return cell
    }
    
}
