//
//  LoginView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        VStack {
            HeaderView(title: "Welcome", subtitle: "Log in to manage your tasks", gradientColors: [.blue, .teal])
            Form {
                TextField("Email", text: $viewModel.email).autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                Button("Login", action: viewModel.login)
                NavigationLink("Register", destination: RegisterView())
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(.red)
                }
            }
        }
    }
}


#Preview {
    LoginView()
}
