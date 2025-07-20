//
//  LoginView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            //header
            ZStack {
                RoundedRectangle(cornerRadius:0)
                    .foregroundColor(Color.pink)
                    .rotationEffect(Angle(degrees: 15))
                    
                
                VStack {
                    Text("To Do List")
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text("Get things done")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(.top, 30)
            }
            .frame(width: UIScreen.main.bounds.width * 3,
                   height: 300)
            .offset(y: -100)
            //Login Form
            
            
            //Create Account
            
            Spacer()
            
        }
    }
}

#Preview {
    LoginView()
}
