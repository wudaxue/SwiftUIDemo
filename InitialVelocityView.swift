//
//  InitialVelocityView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct InitialVelocityView: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]), center: .center, startRadius: 10, endRadius: 400)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                TitleText("Interpolating Spring").foregroundStyle(Color("Gold"))
                SubtitleText("Initial Velocity")
                BannerText(_text: "Initial velocity is how fast the start of the animation is.", backColor: Color("Gold"))
                Button("Compare Initial Velocity") {
                    change.toggle()
                }
                HStack(alignment: .bottom, spacing: 40) {
                    VStack {
                        Text("0").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 0.01, stiffness: 50, damping: 7,initialVelocity: 0), value: change)
                    }
                    VStack {
                        Text("5").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass:0.5, stiffness: 50, damping: 7,initialVelocity: 5), value: change)
                    }
                    VStack {
                        Text("10").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 1,stiffness: 50, damping: 7,initialVelocity: 10), value: change)
                    }
                    VStack {
                        Text("50").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 10,stiffness: 50, damping: 7,initialVelocity: 50), value: change)
                    }
                    VStack {
                        Text("100").bold()
                        Spacer()
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 25, height: change ? 400 : 25)
                            .animation(.interpolatingSpring(mass: 100,stiffness: 50, damping: 7,initialVelocity: 100), value: change)
                    }
                }
                .font(.system(size: 25))
                .foregroundStyle(.white)
            }
            .font(.title)
        }
    }
}

#Preview {
    InitialVelocityView()
}
