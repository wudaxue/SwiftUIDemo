//
//  ContentView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/9.
//

import SwiftUI

struct ContentView: View {
    @State private var change = false
    var offsetValue: CGFloat = 200
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Title")
            SubtitleText("SubtitleText")
            BannerText(_text: "Banner text.", backColor: .blue, textColor: .white)
            
            VStack(spacing: 1) {
                HStack(alignment: .bottom, spacing: 1) {
                    Rectangle()
                        .frame(width: 70, height: 35)
                        .offset(x: change ? 0 : -offsetValue)
                    Rectangle()
                        .frame(width: 35, height: 70)
                        .offset(y: change ? 0 : -offsetValue)
                }.offset(x: -18)
                HStack(alignment: .top, spacing: 1) {
                    Rectangle()
                        .frame(width: 36, height: 72)
                        .offset(y: change ? 0 : offsetValue)
                    Rectangle()
                        .frame(width: 72, height: 36)
                        .offset(x: change ? 0 : offsetValue)
                }.offset(x: 18)
            }
            .rotationEffect(.degrees(change ? 0 : -90))
            .foregroundStyle(change ? .red : .orange)
            .opacity(change ? 1 : 0) // Transparent until change occurs
            .animation(.default, value: change)
            
            
            Button("Change") {
                change.toggle()
            }.padding(.bottom)
        }
        .font(.title)
    }
}

#Preview {
    ContentView()
}
