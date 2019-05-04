//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by Enrique on 2019-05-02.
//  Copyright © 2019 Enrique. All rights reserved.
//

import UIKit
import CoreData

class TodoTableViewController: UITableViewController {
    
    // MARK: - Properties
    var resultsController: NSFetchedResultsController<Todo>!
    let coreDataStack = CoreDataStack()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request: NSFetchRequest<Todo> = Todo.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "date", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        resultsController = NSFetchedResultsController (fetchRequest: request, managedObjectContext: coreDataStack.managerContext, sectionNameKeyPath: nil, cacheName: nil)
        
        do {
            try resultsController.performFetch()
        } catch {
            print("Perform fetch error \(error)")
        }
    }
    
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultsController.sections?[section].objects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        
        let todo = resultsController.object(at: indexPath)
        cell.textLabel?.text = todo.title
        
        return cell
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
        let action = UIContextualAction(style: .destructive, title: "Check") { (action, view, completion) in
            // TODO: Delete Todo
            completion(true)
        }
        action.image = UIImage(named: "check")
        action.backgroundColor = .green
        
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    

     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let _ = sender as? UIBarButtonItem, let vc = segue.destination as? AddViewController {
            vc.manageContext = coreDataStack.managerContext
        }
     }
    
}
