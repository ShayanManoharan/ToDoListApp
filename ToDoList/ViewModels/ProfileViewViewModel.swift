//
//  ProfileViewViewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation
import FirebaseAuth
import Firebase

class ProfileViewModel: ObservableObject {
    @Published var user: User?

    func fetchProfile() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            self.user = User(
                id: uid,
                email: data["email"] as? String ?? "",
                joined: data["joined"] as? TimeInterval ?? 0
            )
        }
    }
}
