//
//  User.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation

struct User: Codable {
    let id: String
    let email: String
    let joined: TimeInterval
}
