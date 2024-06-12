//
//  SpringAnimationView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct SpringAnimationView: View {
    @State private var show = false
    @State private var dampingFraction = 0.825
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
            .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Spring").foregroundStyle(Color("Gold"))
                SubtitleText("Introduction")
                BannerText(_text: "The spring animation adds a bounce to your animations.", backColor: Color("Gold"))
                RoundedRectangle(cornerRadius: 40)
                    .fill(Color("Gold"))
                    .overlay(Image("Phone"))
                    .padding()
                    .scaleEffect(show ? 1 : 0.01, anchor: .bottom)
                    .opacity(show ? 1 : 0)
                    .animation(.spring(response: 0.5,dampingFraction: dampingFraction), value: show) // Adjust the "springiness"
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: show ? "person.2.fill" : "person.2")
                        .foregroundStyle(Color("Gold"))
                        .font(.largeTitle)
                }).tint(Color("Accent"))
                
                HStack {
                    Image(systemName: "0.circle.fill")
                    Slider(value: $dampingFraction)
                    Image(systemName: "1.circle.fill")
                }
                .foregroundStyle(Color("Gold")).padding()
            }
            .font(.title)
        }
    }
}

#Preview {
    SpringAnimationView()
}
