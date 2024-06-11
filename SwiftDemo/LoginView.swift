//
//  LoginView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct LoginView: View {
    @State private var showLogin = false
    @State private var userName = ""
    @State private var password = ""
    
    let xOffset: CGFloat = -200
    let duration: Double = 0.7
    let delay = 0.5
    
    var body: some View {
        ZStack {
            // Background
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),center: .center, startRadius: 10, endRadius: 400).ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Exercise").foregroundStyle(Color("Gold"))
                    .font(Font.custom("DIN Condensed Bold", size: 70))
                Text("Show Login").foregroundStyle(.gray)
                Spacer()
                VStack(spacing: 30) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 70)) // Make symbol bigger
                        .padding()
                        .foregroundStyle(Color("Gold"))
                        .scaleEffect(showLogin ? 1 : 4) // Start large, go smaller
                        .animation(.easeIn(duration: duration/2).delay(delay), value: showLogin)
                    TextField("Username", text: $userName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(.easeOut(duration: duration).delay(delay + 0.2), value: showLogin)
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(.easeOut(duration: duration).delay(delay + 0.4), value: showLogin)
                    Button("Login", action: { })
                        .foregroundStyle(Color("Accent"))
                        .opacity(showLogin ? 1 : 0)
                        .offset(x: showLogin ? 0 : xOffset)
                        .animation(.easeOut(duration: duration).delay(delay + 0.6), value: showLogin)
                }
                .padding(.horizontal)
                // Add twice as much space on bottom
                .onAppear {
                    showLogin = true
                }
                Spacer()
                Spacer()
            }
            .padding(.top)
            .font(.title)
        }
    }
}

#Preview {
    LoginView()
}
