//
//  Overlapping.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct Overlapping: View {
    @State private var degrees = 0.0
    @State private var taps = 0
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
            .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Interpolating Spring")
                    .foregroundStyle(Color("Gold"))
                SubtitleText("Overlapping the Animation")
                BannerText(_text: "Triggering an interpolatingSpring multiple times can increase the strength of the animation each time.", backColor: Color("Gold"))
                Circle()
                    .fill(Color("Gold"))
                    .frame(width: 300, height: 300)
                    .overlay(Image(systemName: "arrow.up").offset(y: -120))
                    .rotationEffect(.degrees(degrees))
                    .animation(.interpolatingSpring(stiffness: 1, damping: 0.8), value: degrees)
                    .onTapGesture {
                        degrees += 25
                        taps += 1
                    }
                Text("Taps: \(taps)")
                    .foregroundStyle(Color("Gold"))
            }
            .font(.title)
        }
    }
}

#Preview {
    Overlapping()
}
