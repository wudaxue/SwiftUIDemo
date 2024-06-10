//
//  TriggerView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/9.
//

import SwiftUI

struct TriggerView: View {
    @State private var showButtons = false
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 20) {
                TitleText("Triggers")
                SubtitleText("Buttons")
                BannerText(_text: "You've seen this example a lot now. The tap of a button triggers the start of the animation.", backColor: .green, textColor: .white)
                Spacer()
            }
            Group {
                Button(action: { showButtons.toggle() }) {
                    Image(systemName: "bag.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : -90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .opacity(showButtons ? 1 : 0)
                .offset(x: 0, y: showButtons ? -150 : 0)
                Button(action: { showButtons.toggle() }) {
                    Image(systemName: "gauge.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -110 : 0, y: showButtons ? -110 : 0)
                .opacity(showButtons ? 1 : 0)
                Button(action: { showButtons.toggle() }) {
                    Image(systemName: "calendar.badge.plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 0 : 90))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
                .offset(x: showButtons ? -150 : 0, y: 0)
                .opacity(showButtons ? 1 : 0)
                Button(action: { showButtons.toggle() }) {
                    Image(systemName: "plus")
                        .padding(24)
                        .rotationEffect(Angle.degrees(showButtons ? 45 : 0))
                }
                .background(Circle().fill(Color.green).shadow(radius: 8, x: 4, y: 4))
            }
            .padding(.trailing, 20)
            .tint(.white)
            .animation(.default, value: showButtons)
        }
        .font(.title)
    }
}

#Preview {
    TriggerView()
}
