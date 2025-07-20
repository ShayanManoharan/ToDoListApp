//
//  ContentView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/19/25.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @StateObject private var sharedListVM = ToDoListViewModel()

    var body: some View {
        NavigationView {
            if Auth.auth().currentUser != nil {
                TabView {
                    ToDoListView(viewModel: sharedListVM)
                        .tabItem { Label("Tasks", systemImage: "list.bullet") }
                    NewItemsView(listViewModel: sharedListVM)
                        .tabItem { Label("New", systemImage: "plus") }
                }
            } else {
                LoginView()
            }
        }
    }
}


#Preview {
    MainView()
}
