//
//  TriggerScrollView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct TriggerScrollView: View {
    var body: some View {
        VStack {
            TitleText("Trigger")
            SubtitleText("ScrollView")
            BannerText(_text: "Although no animation modifier is used, the ScrollView is changing values (locations of views) that you can use to modify views. Here is a parallax effect as an example:", backColor: .green)
            
            ScrollView {
                ZStack {
                    GeometryReader { gp in
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -gp.frame(in: .global).origin.y / 2)
                    }
                    VStack(spacing: 40) {
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                        RoundedRectangle(cornerRadius: 20).frame(height: 200).opacity(0.7)
                    }
                    .padding(40)
                }
                .ignoresSafeArea(edges: .vertical)
            }
        }
        .font(.title)
    }
}

#Preview {
    TriggerScrollView()
}
