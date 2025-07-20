//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
}
