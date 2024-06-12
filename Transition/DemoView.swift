//
//  DemoView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct DemoView: View {
    @State private var change = false
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .ignoresSafeArea(edges: .vertical)
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundStyle(Color("LightShade2"))
                SubtitleText("Introduction").foregroundStyle(Color("LightAccent2"))
                BannerText(_text: "Use the transition modifier to specify how a view enters and exits the screen.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                Button("Change") {
                    withAnimation(.default) {
                        change.toggle()
                    }
                }
                Spacer()
//                Group {
                    if change {
                        Image("pink")
                        //.transition(.move(edge: .bottom))
//                            .transition(.opacity.animation(.easeInOut(duration: 1)))
                            .transition(.scale(scale: 3).animation(.default))
                    }
//                }
//                .animation(.easeInOut(duration: 1), value: change)
                Spacer()
            }
            .font(.title)
            .tint(Color("Accent2"))
        }
    }
}

#Preview {
    DemoView()
}
