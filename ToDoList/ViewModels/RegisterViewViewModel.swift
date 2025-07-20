//
//  RegisterViewViewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    func register() {
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Missing fields"
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let user = result?.user {
                let db = Firestore.firestore()
                db.collection("users").document(user.uid).setData([
                    "email": self.email,
                    "joined": Date().timeIntervalSince1970
                ])
            } else if let error = error {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}

