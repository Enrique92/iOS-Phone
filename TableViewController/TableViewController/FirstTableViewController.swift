//
//  FirstTableViewController.swift
//  TableViewController
//
//  Created by Enrique on 2019-04-26.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var names:[String] = ["Derrick", "Masa", "Shota", "Ayana", "Juan", "Hao-Tse", "Gui", "Paulo", "Danilo", "Kazuya", "Mihail", "Ozan", "Daisuke", "Enrique", "Tom"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // TableView data source protocol method
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Delegate protocol method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NameCell
        cell.nameCell?.text = names[indexPath.row]
        return cell
        
    }
}
