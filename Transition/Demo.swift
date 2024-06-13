//
//  Demo.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/13.
//

import SwiftUI

struct Demo: View {
    @State private var step1 = true
    
    var body: some View {
        ZStack {
            Color("Background3")
            
            VStack(spacing: 60) {
                Spacer()
                
                if step1 {
                    Text("Ready to travel?")
                        .bold()
                        .foregroundStyle(Color("Secondary3"))
                        .transition(.move(edge: .leading))
                }
                
                if step1 {
                    VStack(spacing: 60) {
                        Image("pink")
                            .resizable()
                            .frame(height: 300)
                            .animation(.easeIn(duration: 1), value: step1)
                        Capsule()
                            .fill(Color("Secondary3"))
                            .frame(height: 100)
                            .offset(x: -50)
                            .animation(.easeInOut(duration: 0.6), value: step1)
                            .overlay(Text("Let's go!")
                                .foregroundStyle(Color("Foreground3"))
                                .animation(.easeOut(duration: 0.6), value: step1))
                    }
                    .transition(.move(edge: .leading))
                }
                Spacer()
            }
            .animation(.easeOut(duration: 1.1), value: step1)
            
            VStack(spacing: 5) {
                if step1 == false {
                    Text("Where do you want to go?")
                        .bold()
                        .padding(.horizontal, 50)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color("Secondary3"))
                        .transition(.move(edge: .top))
                }
                if step1 == false {
                    TripDetailsView()
                        .transition(.move(edge: .trailing))
                }
                if step1 == false {
                    Image("airplane")
                        .padding(.bottom, 100)
                        .transition(.move(edge: .bottom))
                }
            }
            .animation(.easeOut(duration: 0.8), value: step1)
            .padding(.top, 40)
            
            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button(action: {
                        step1.toggle()
                    }, label: {
                        Image(systemName: "chevron.left.circle.fill")
                            .rotationEffect(.degrees(step1 ? 180 : 0))
                    })
                    
                    if step1 == false {
                        Button(action: {
                            step1.toggle()
                        }, label: {
                            Image(systemName: "chevron.right.circle.fill")
                        })
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                    }
                }
                .font(.system(size: 50))
                .animation(.easeOut(duration: 1), value: step1)
            }
            .padding(.bottom, 75)
        }
        .font(.largeTitle)
        .tint(Color("Accent3"))
        .ignoresSafeArea()
    }
}

struct TripDetailsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Destination:")
                .foregroundStyle(Color("Foreground3"))
            Button(action: {}) {
                Text("Select")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Departure:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Today")
                Spacer()
                Image(systemName: "chevron.right")
            }
            Text("Return:")
                .foregroundStyle(Color("Foreground3"))
                .padding(.top)
            Button(action: {}) {
                Text("Tomorrow")
                Spacer()
                Image(systemName: "chevron.right")
            }
        }
        .padding(25)
        .background(RoundedRectangle(cornerRadius: 10)
            .foregroundStyle(Color("Secondary3")))
        .padding(40)
        .font(.body)
    }
}

#Preview {
    Demo()
}
