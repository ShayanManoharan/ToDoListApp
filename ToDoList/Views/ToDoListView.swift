//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct ToDoListView: View {
    @ObservedObject var viewModel: ToDoListViewModel
    var body: some View {
        VStack {
            HeaderView(title: "To Do List", subtitle: "Stay organized. Crush goals.", gradientColors: [.pink, .purple])
            if viewModel.items.isEmpty {
                Text("No tasks yet. Tap + to add.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .strikethrough(item.isDone)
                                    .font(.headline)
                                Text("Due: \(Date(timeIntervalSince1970: item.dueDate), formatter: dateFormatter)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Button(action: { viewModel.toggleDone(item) }) {
                                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(item.isDone ? .green : .gray)
                            }
                        }
                    }.onDelete { indexSet in
                        indexSet.forEach { viewModel.delete(viewModel.items[$0]) }
                    }
                }
            }
        }.onAppear(perform: viewModel.fetchItems)
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
