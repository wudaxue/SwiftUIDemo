//
//  RepeatCountView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct RepeatCountView: View {
    @State private var start = false
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Repeating")
            SubtitleText("Repeat Count")
            BannerText(_text: "You might want an animation to repeat only a certain number of times.", backColor: .green)
            Spacer()
            Button("Start", action: { start.toggle() })
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1))
                .animation(.easeOut(duration: 0.6).repeatCount(3), value: start) // Repeat 3 times
            Spacer()
            Button("Start1", action: { start = true })
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1))
                .animation(Animation.easeOut(duration: 0.6)
                    .repeatCount(3, autoreverses: false), value: start)
            Button("Start2", action: { start = true })
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.green))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 4)
                        .scaleEffect(start ? 2 : 1)
                        .opacity(start ? 0 : 1))
                .animation(Animation.easeOut(duration: 0.6)
                    .delay(1) // Add 1 second between animations
//                    .repeatForever(autoreverses: false), value: start)
                    .repeatForever(autoreverses: false), value: start)
            Spacer()
        }
        .font(.title)
    }
}

#Preview {
    RepeatCountView()
}
