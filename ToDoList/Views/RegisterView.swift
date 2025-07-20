//
//  RegisterView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    var body: some View {
        VStack {
            HeaderView()
            Form {
                TextField("Email", text: $viewModel.email).autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                Button("Register", action: viewModel.register)
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage).foregroundColor(.red)
                }
            }
        }
    }
}


#Preview {
    RegisterView()
}
