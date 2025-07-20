//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation
import FirebaseAuth
import Firebase

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var errorMessage = ""

    func save(to listViewModel: ToDoListViewModel, completion: @escaping () -> Void) {
        guard !title.isEmpty else {
            errorMessage = "Enter title"
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        let id = UUID().uuidString
        let item = ToDoListItem(id: id, title: title, dueDate: dueDate.timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false)
        try? db.collection("users").document(uid).collection("todos").document(id).setData(from: item)
        listViewModel.addItem(item)
        completion()
    }
}
