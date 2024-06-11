//
//  LongDurationView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct LongDurationView: View {
    @State private var change = false
    var body: some View {
        VStack {
            Group {
                Image(systemName: "1.circle")
                    .opacity(change ? 1 : 0)
                    .animation(.easeIn.delay(0.5), value: change)
                Image(systemName: "2.circle")
                    .opacity(change ? 1 : 0)
                    .animation(.easeIn.delay(0.9), value: change)
                Image(systemName: "3.circle")
                    .opacity(change ? 1 : 0)
                    .animation(.easeIn.delay(1.3), value: change)
            }.font(.system(size: 100))
            Button("Go!", action: {})
                .font(.system(size: 70))
                .foregroundStyle(.white)
                .padding(25)
                .background(Circle().fill(Color.green))
                .opacity(change ? 1 : 0)
                .animation(.easeIn.delay(1.7), value: change)
        }
        ZStack {
            Image(systemName: "cloud.sun.fill")
                .font(.system(size: 200))
                .foregroundStyle(.purple)
                .opacity(0.3)
                .offset(x: change ? 240: -240, y:20)
                .animation(.linear(duration: 15), value: change)
            Image(systemName: "cloud.fill")
                .font(.system(size: 200))
                .foregroundStyle(.purple)
                .opacity(0.3)
                .offset(x: change ? -240 : 240, y: 200)
                .animation(.linear(duration: 10), value: change)
            VStack(spacing: 20) {
                TitleText("Animation Options")
                SubtitleText("Long Duration Example")
                BannerText(_text: "Sometimes you want a very long duration to create subtle effects on your UI.", backColor: .purple, textColor: .white)
                Spacer()
                Button("Change") {
                    change.toggle()
                }
            }
            .font(.title)
        }
        
    }
}

#Preview {
    LongDurationView()
}
