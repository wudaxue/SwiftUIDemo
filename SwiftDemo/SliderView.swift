//
//  SliderView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct SliderView: View {
    @State private var blueWidth: CGFloat = 50.0
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Slider")
            BannerText(_text: "When adjusting a slider, there may be some UI element you are changing that can be animated.", backColor: .green)
            HStack(spacing: 0) {
                Color.blue
                    .frame(width: blueWidth)
                Color.green
            }
            .animation(.default, value: blueWidth)
            Slider(value: $blueWidth, in: 0...410, step: 1)
                .padding()
        }
        .font(.title)
    }
}

#Preview {
    SliderView()
}
