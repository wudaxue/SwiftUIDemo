//
//  DurationView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct DurationView: View {
    @State private var change = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Animation Options")
            SubtitleText("Duration Parameter")
            BannerText(_text: "To set a duration, you need to turn the animation type into a function.Like .easeInOut into .easeInOut(duration: 1).",backColor: .purple, textColor: .white)
            
            Text("Duration: Default")
            Image(systemName: "hare.fill")
                .foregroundStyle(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut, value: change) // Default duration
            Text("Duration: 2 Seconds")
            Image(systemName: "tortoise.fill")
                .foregroundStyle(.purple)
                .frame(width: 100, height: 100)
                .offset(x: change ? 150 : -150, y: 0)
                .animation(.easeOut(duration: 2), value: change) // Two seconds
            Button("Change") {
                change.toggle()
            }
            BannerText(_text: "Note: The default animation duration in SwiftUI is less than a second. Somewhere around 0.4 seconds.", backColor: .purple, textColor: .white)
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    DurationView()
}
