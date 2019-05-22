//
//  ToDo.swift
//  ToDoList
//
//  Created by Enrique Alcaide on 05/21/2019.
//  Copyright © 2019 Enrique Alcaide. All rights reserved.
//

import Foundation

struct ToDo: Codable {
    // Create the atributes for the task
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("todos").appendingPathExtension("plist")
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: ArchiveURL) else { return nil }
        
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    
    // Load the initial task into the tableView
    static func loadSampleToDos() -> [ToDo] {
        return [
            ToDo(title: "Read", isComplete: false, dueDate: Date(), notes: "Read at least 100 pages."),
            ToDo(title: "Sleep", isComplete: false, dueDate: Date(), notes: "Sleep 30 minutes of nap."),
            ToDo(title: "Walk", isComplete: false, dueDate: Date(), notes: "Walk during 30 minutes.")
        ]
    }
    
    // Save the changes for the task
    static func saveToDos(_ todos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedToDos = try? propertyListEncoder.encode(todos)
        try? codedToDos?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    // Create the date picker for the task
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
