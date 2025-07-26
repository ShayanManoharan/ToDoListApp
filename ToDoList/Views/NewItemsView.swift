//
//  NewItemsView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct NewItemsView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Environment(\.dismiss) var dismiss
    var listViewModel: ToDoListViewModel

    var body: some View {
        VStack {
            HeaderView(title: "Add New Task", subtitle: "Plan ahead and stay on track", gradientColors: [Color.blue, Color.green])
            Form {
                TextField("Title", text: $viewModel.title)
                DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                Button("Add to your To Do List") {
                    viewModel.save(to: listViewModel) {
                        dismiss()
                    }
                }
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(.red)
                }
            }
        }
    }
}

