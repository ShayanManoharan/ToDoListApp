//
//  HeaderView.swift
//  ToDoList
//
//  Created by Shayan Manoharan on 5/20/25.
//

import SwiftUI

struct HeaderView: View {
    var title: String
    var subtitle: String
    var gradientColors: [Color]

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.top)
            VStack(spacing: 10) {
                Text(title)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundColor(.white)
                Text(subtitle)
                    .font(.system(size: 20))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.top, 50)
        }
        .frame(height: 200)
    }
}
