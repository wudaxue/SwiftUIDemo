//
//  AlertView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/12.
//

import SwiftUI

struct AlertView: View {
    @State private var isShowingBasicAlert = false
    @State private var isShowingEnterValueAlert = false
    @State private var valueString = ""
    
    @State private var isShowingLoginAlert = false
    @State private var error:MyAppError = .noNetwork
    
    var body: some View {
        VStack (spacing: 40) {
            Button("Fetch Data") {
                isShowingBasicAlert = true
            }.alert("No Network", isPresented: $isShowingBasicAlert) {
                Button("Try Again") {}
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("No network detected.Connect to wi-fi or cellular and try again")
            }
            
            Button("Enter Data") {
                isShowingEnterValueAlert = true
            }.alert("Enter Value", isPresented: $isShowingEnterValueAlert) {
                TextField("Value", text: $valueString)
                Button("Submit") {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("3")
            }
            
            Button("Login In") {
                error = .invalidPassword
                isShowingLoginAlert = true
            }.alert(isPresented:$isShowingLoginAlert, error: error){ error in
                if error == .invalidUserName {
                    TextField("Username", text: $valueString)
                    Button("Submit") {}
                    Button("Cancel", role: .cancel) {}
                } else {
                    Text(error.failureReason!)
                }
            } message: { error in
                Text(error.failureReason!)
            }

        }
    }
}

#Preview {
    AlertView()
}
                    
enum MyAppError: LocalizedError {
    case invalidUserName
    case invalidPassword
    case noNetwork
                
    var errorDescription: String? {
        switch self {
        case .invalidUserName:
            "Invalid Username"
        case .invalidPassword:
            "Invalid Password"
        case .noNetwork:
            "No Network Connection"
        }
    }
                
    var failureReason: String? {
        switch self {
        case .invalidUserName:
            "The username entered does not exist in our database."
        case .invalidPassword:
            "The password entered for the username is incorrect."
        case .noNetwork:
            "Unable to detect a network connection.Please connect to wi-fi or cellular and try again."
        }
    }
}
