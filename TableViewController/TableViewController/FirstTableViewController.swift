//
//  FirstTableViewController.swift
//  TableViewController
//
//  Created by Enrique on 2019-04-26.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    var names:[String] = [
        "Derrick", "Tom", "Gui", "Kazuya", "Juan", "Hao-tse", "Paulo",
        "Scott", "Ayana", "Shota", "Masa", "Enrique", "Mihail", "Ozan",
        "Daisuke", "Danilo"
    ]
    
    var names:[String] = [
        "AAAA", "BBBB", "CCCC", "DDDD", "EEEEE", "FFFF", "GGGG",
        "HHHHH", "IIII", "JJJJ", "KKKK", "LLLLL", "MMMMM", "NNNNN",
        "OOOOO", "PPPPP"
    ]

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
        let cellName = tableView.dequeueReusableCell(withIdentifier: "cellName", for: indexPath) as! NameCell
        
        cellName.nameCell?.text = names[indexPath.row]
        return cellName
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellSurname = tableView.dequeueReusableCell(withIdentifier: "cellSurname", for: indexPath) as! SurnameCell
        
        cellSurname.surnameCell?.text = names[indexPath.row]
        return cellSurname
    }
}
