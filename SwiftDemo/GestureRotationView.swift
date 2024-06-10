//
//  GestureRotationView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct GestureRotationView: View {
    @State private var degrees = 0.0
    var body: some View {
        VStack {
            TitleText("Triggers")
            SubtitleText("Rotation Gesture")
            BannerText(_text: "Use the rotation gesture to change an angle of a view and the animation will smooth out the rotation effect.", backColor: .green)
            Spacer()
            
            Group {
                Image(systemName: "gear")
                    .font(.system(size: 300))
                    .rotationEffect(Angle.degrees(degrees))
                    .gesture(RotationGesture()
                        .onChanged({ (angle) in
                            degrees = angle.degrees
                        }))
                    .animation(.default, value: degrees)
                Image(systemName: "gear")
                    .font(.system(size: 140))
                    .rotationEffect(-Angle.degrees(degrees))
                    .offset(x: 130, y: 10)
                    .animation(.default, value: degrees) // Smooth out the rotation
                Image(systemName: "gear")
                    .font(.system(size: 80))
                    .rotationEffect(Angle.degrees(degrees))
                    .offset(x: 60)
                    .animation(.default, value: degrees)
            }
            .foregroundColor(.green)
            Spacer()
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    GestureRotationView()
}
