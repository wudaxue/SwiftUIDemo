//
//  layout.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct layout: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("DarkAccent2"), Color("DarkShade2")]), startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
            VStack(spacing: 40) {
                Image("Planet")
                    .padding(.vertical, 80)
                Text("PLANET EXPLORER")
                    .font(.largeTitle).bold()
                    .foregroundStyle(Color("LightShade2"))
                VStack {
                    Text("START")
                        .font(.title)
                        .foregroundStyle(Color("LightAccent2"))
                    Text("EXPLORING!")
                        .font(.title)
                        .foregroundStyle(Color("LightAccent2"))
                }
                Button(action: {}) {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color("LightShade2"))
                        .padding(25)
                        .background(Circle().fill(Color("Accent2")).shadow(radius: 10))
                }
            }
        }
    }
}

#Preview {
    layout()
}
