//
//  WithAnimationView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct WithAnimationView: View {
    @State private var flipHorizontally = false
    @State private var flipVertically = false
    
    var body: some View {
        VStack(spacing: 20) {
            TitleText("With Animation")
            SubtitleText("Introduction")
            BannerText(_text: "The withAnimation closure says, 'Anything that changes as a result of any values changing inside this closure will use this animation.", backColor: .yellow, textColor: .black)
            
            HStack(spacing: 50) {
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 1)) {
                        flipHorizontally.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .padding()
                }
                
                Button(action: {
                    withAnimation(Animation.easeOut(duration: 1)) {
                        flipVertically.toggle()
                    }
                }) {
                    Image(systemName: "flip.horizontal.fill")
                        .font(.system(size: 50))
                        .rotationEffect(.degrees(90))
                        .padding()
                }
            }
            
            Image("pink")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .padding()
                .scaleEffect(x: flipHorizontally ? -1 : 1, y: flipVertically ? -1 : 1)
        }
        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WithAnimationView()
}
