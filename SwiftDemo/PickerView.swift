//
//  PickerView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct PickerView: View {
    @State private var segment = 0
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Segmented Control")
            BannerText(_text: "A segmented control (picker) can also trigger animations, such as sliding views into and out of place.", backColor: .green)
            Picker("Day & Night", selection: $segment) {
                Text("Day ☀").tag(0)
                Text("Night 🌙").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .zIndex(1)
            GeometryReader { gp in
                ZStack {
                    VStack(spacing: 20) {
                        HStack {
                            Spacer()
                            Image(systemName: "sun.max.fill").font(.system(size: 50))
                            Spacer()
                        }.padding(.top, 24)
                        Text("The Day Report")
                        Spacer()
                    }
                    .background(Image("day")
                        .aspectRatio(contentMode: ContentMode.fill))
                    .cornerRadius(20)
                    .foregroundStyle(.white)
                    // Offset depending on segment selected
                    .offset(x: segment == 0 ? 0 : -gp.size.width, y: 0)
                    .animation(.default, value: segment) // Animate offset
                    VStack(spacing: 20) {
                        Spacer()
                        HStack {
                            Spacer()
                            Image(systemName: "moon.fill").font(.system(size: 50))
                            Spacer()
                        }
                        Text("The Night Report")
                            .padding(.bottom, 24)
                    }
                    .background(Image("night")
                        .aspectRatio(contentMode: ContentMode.fill))
                    .cornerRadius(20)
                    .foregroundStyle(.orange)
                    // Offset depending on segment selected
                    .offset(x: segment == 1 ? 0 : gp.size.width, y: 0)
                    .animation(.default, value: segment) // Animate offset
                }
                .shadow(radius: 15)
                .padding(.horizontal)
            }
        }.font(.title)
    }
}

#Preview {
    PickerView()
}
