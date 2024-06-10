//
//  DragGestureView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct DragGestureView: View {
    @GestureState private var menuOffset = CGSize.zero
    @State private var currentMenuY: CGFloat = 0.0
    @State private var isLongPressed = false
    
    @State private var isOn = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("Triggers")
            SubtitleText("Drag Gesture")
            BannerText(_text: "Dragging a view will move it but you can add animation to completemoving a view into its final location smoothly.", backColor: .green)
            
            Spacer()
            
            Circle()
                .fill(isLongPressed ? Color.blue : Color.green)
                .frame(width: 200, height: 200)
                .overlay(Text("Long Press"))
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 5)
                        .scaleEffect(isLongPressed ? 2 : 1)
                        .opacity(isLongPressed ? 0 : 1))
                .onLongPressGesture {
                    isLongPressed.toggle()
                }
                .animation(.default, value: isLongPressed) // Animate changes when long press completes
            
            Circle()
                .fill(isOn ? Color.green : Color.red)
                .frame(width: 200, height: 200)
                .overlay(Text("ON").opacity(isOn ? 1 : 0))
                .overlay(Text("OFF").foregroundStyle(.white).opacity(isOn ? 0 : 1))
                .onTapGesture(count: 2, perform: {
                    isOn.toggle()
                })
                .shadow(color: isOn ? .green : .red, radius: 50)
                .animation(.default, value: isOn)
            
            VStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height:100)
                    .overlay(Image(systemName: "line.horizontal.3")
                        .foregroundStyle(.white)
                        .offset(x: 0, y: -20))
                    .offset(x: 0, y: -50)
                HStack {
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 200)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.green))
            .offset(x: 0, y: currentMenuY + menuOffset.height)
            .gesture(DragGesture().updating($menuOffset, body: { (value, menuOffset, transaction) in
                menuOffset = value.translation
            })
                .onEnded({ value in
                    // This is what is getting animated
                    if value.translation.height > 100 {
                        currentMenuY = 200 // collapsed
                    } else {
                        currentMenuY = 0 // expanded
                    }
                })
            ).animation(.default, value: currentMenuY) // Animate the menu sliding into final position
        }
        .font(.title)
    }
}

#Preview {
    DragGestureView()
}
