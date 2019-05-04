//
//  MainTableViewController.swift
//  Assignment6
//
//  Created by Enrique on 2019-05-01.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    @IBOutlet var tableViewMain: UITableView!
    @IBOutlet var buttonEdit: UIBarButtonItem!
    
    var items : [ToDo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Function to allow reordering
    @IBAction func editingItem(_ sender: Any) {
        tableViewMain.isEditing = !tableViewMain.isEditing
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = items[sourceIndexPath.row]
        
        // Remove the item from the cell
        items.remove(at: sourceIndexPath.row)
        
        // Insert the new item in the position
        items.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            // TODO: Delete Todo
            completion(true)
        }
        action.image = UIImage(named: "trash")
        action.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal, title: "Check") { (action, view, completion) in
            // TODO: Delete Todo
            completion(true)
        }
        action.image = UIImage(named: "check")
        action.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? CellTableView
        let toDo = items[indexPath.row]
        cell?.textLabel?.text = toDo.name
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Call to the next viewController
        if let addVC = segue.destination as? AddViewController {
            // Refering to the current class
            addVC.previousVC = self
        }
        
        if let detailsVC = segue.destination as? DetailViewController {
            detailsVC.getName = items[(tableViewMain.indexPathForSelectedRow?.row)!]
            //detailsVC.previousVC = self
        }
    }
}
