//
//  ToDoListViewVIewModel.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import Foundation
import Firebase
import FirebaseAuth

class ToDoListViewModel: ObservableObject {
    @Published var items: [ToDoListItem] = []

    func fetchItems() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").getDocuments { snapshot, error in
            if let docs = snapshot?.documents {
                self.items = docs.compactMap { doc -> ToDoListItem? in
                    try? doc.data(as: ToDoListItem.self)
                }
            }
        }
    }

    func toggleDone(_ item: ToDoListItem) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        var updated = item
        updated.isDone.toggle()
        try? db.collection("users").document(uid).collection("todos").document(item.id).setData(from: updated)
        fetchItems()
    }

    func delete(_ item: ToDoListItem) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("todos").document(item.id).delete()
        fetchItems()
    }

    func addItem(_ item: ToDoListItem) {
        items.append(item)
    }
}
