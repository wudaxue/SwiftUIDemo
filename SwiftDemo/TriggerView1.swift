//
//  TriggerView1.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct TriggerView1: View {
    @State private var showTip = true
    @State private var showTipButton = false
    
    var body: some View {
        VStack(spacing: 20) {
            if showTip {
                VStack(spacing: 20) {
                    HStack {
                        Image(systemName: "info.circle.fill")
                        Spacer()
                        Text("Tip of the Day")
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    Spacer()
                    Button("Got It") {
                        showTip.toggle()
                    }
                }.padding()
                    .background(Rectangle().fill(Color.green)
                        .shadow(radius: 3))
                    .padding(.horizontal)
                    .frame(height: 200)
                    .onDisappear {
                        // Gets triggered when the view is removed from the screen
                        showTipButton = true
                    }
            }
            if showTipButton {
                HStack {
                    Button(action: {
                        showTipButton = false
                        showTip = true
                    }) {
                        Image(systemName: "info.circle")
                    }
                    .padding(.leading, 24)
                    Spacer()
                }
            }
        }
        .animation(.default, value: showTipButton) // Animate the adding and removing of views from the screen
        .font(.title)
    }
}

#Preview {
    TriggerView1()
}
