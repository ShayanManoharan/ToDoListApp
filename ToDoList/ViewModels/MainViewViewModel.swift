//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var isSignedIn: Bool = Auth.auth().currentUser != nil

    func signOut() {
        try? Auth.auth().signOut()
        isSignedIn = false
    }
}
