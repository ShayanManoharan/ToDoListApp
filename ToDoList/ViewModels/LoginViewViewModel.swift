//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
// hi

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    func login() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Missing fields"
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
