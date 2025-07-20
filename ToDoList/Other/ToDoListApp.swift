//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/19/25.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
