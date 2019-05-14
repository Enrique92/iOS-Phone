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
    
    // Get the prioroties
    var itemsList: [ItemPriority] = ItemPriority.getPriorityItems()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = tableView.rowHeight
    }
    
    // MARK: - Function to allow reordering
    @IBAction func editingItem(_ sender: Any) {
        tableViewMain.isEditing = !tableViewMain.isEditing
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: - Number of sections for the products
    override func numberOfSections(in tableView: UITableView) -> Int {
        return itemsList.count
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = itemsList[sourceIndexPath.row]
        
        // Remove the item from the cell
        itemsList.remove(at: sourceIndexPath.row)
        
        // Insert the new item in the position
        itemsList.insert(itemToMove, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsList[section].items.count
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
        // Cast the cellTableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! CellTableView
        
//        let itemToDo = itemsList[indexPath.section]
//        let item = itemToDo.priority
        let itemsListToDo = itemsList[indexPath.section]
        let items = itemsListToDo.items
        let item = items[indexPath.row]
        
        // Item assing to the cell
        cell.item = item
        
        //cell.textLabel?.text = itemsToDo.name
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let itemTitle = itemsList[section]
//        return itemTitle.priority
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Call to the next viewController
        if let addVC = segue.destination as? AddViewController {
            // Refering to the current class
            addVC.previousVC = self
        }
        
//        if let detailsVC = segue.destination as? DetailViewController {
//            detailsVC.getName = itemsList[(tableViewMain.indexPathForSelectedRow?.row)!]
//        }
    }
}