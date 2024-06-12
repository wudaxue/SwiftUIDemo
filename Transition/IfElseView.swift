//
//  IfElseView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/12.
//

import SwiftUI

struct IfElseView: View {
    @State private var change = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2").ignoresSafeArea()
            
            VStack (spacing: 30) {
                TitleText("Transitions").foregroundStyle(Color("LightShade2"))
                SubtitleText("If Else Problem").foregroundStyle(Color("LightAccent2"))
                BannerText(_text: "Transitions define how views are inserted and removed. This means you will have views in an if block. But what about switching between two views using the else block? Take a look:", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                Button("Change") {
                    change.toggle()
                }.padding(.bottom)
                
                if change {
                    Image("pink").resizable()
                        .frame(width:100)
                        .transition(.move(edge: .leading))
                } 
                if change == false {
                    Image("pink2").resizable()
                        .frame(width: 100)
                        .transition(.move(edge: .trailing))
                }
                
                Spacer()
            }
            .animation(.default, value: change)
        }
        .font(.title)
        .tint(Color("Accent2"))
    }
}

#Preview {
    IfElseView()
}
