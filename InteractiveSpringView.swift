//
//  InteractiveSpringView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct InteractiveSpringView: View {
    @State private var change = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color("Dark"), Color("Darkest")]),
                           center: .center, startRadius: 10, endRadius: 400)
            .ignoresSafeArea()
            VStack(spacing: 20) {
                TitleText("Interactive Spring").foregroundStyle(Color("Gold"))
                SubtitleText("Comparison")
                BannerText(_text: "Here is a comparison between the spring and interactiveSpring animations.", backColor: Color("Gold"))
                Button("Change") {
                    change.toggle()
                }
                HStack(alignment: .top, spacing: 50.0) {
                    VStack {
                        Text("spring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.spring(), value: change)
                    }
                    VStack {
                        Text("interactiveSpring")
                        Rectangle()
                            .fill(Color("Gold"))
                            .frame(width: 100, height: change ? 400 : 100)
                            .animation(.interactiveSpring(), value: change)
                    }
                }.foregroundStyle(.white)
                Spacer()
            }.font(.title)
        }
    }
}

#Preview {
    InteractiveSpringView()
}
