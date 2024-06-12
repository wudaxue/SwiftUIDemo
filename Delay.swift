//
//  Delay.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct Delay: View {
    @State private var change = false
    var body: some View {
        VStack(spacing: 10) {
            Group {
                Circle()
                    .overlay(Text("bouncy").foregroundStyle(.white))
                    .animation(.spring(.bouncy), value: change)
                Circle()
                    .overlay(Text("smooth").foregroundStyle(.white))
                    .animation(.spring(.smooth), value: change)
                Circle()
                    .overlay(Text("snappy").foregroundStyle(.white))
                    .animation(.spring(.snappy), value: change)
                Circle()
                    .overlay(Text("bouncy").foregroundStyle(.white))
                    .animation(.bouncy(duration: 0.5, extraBounce: 0.0), value: change)
                Circle()
                    .overlay(Text("long").foregroundStyle(.white))
                    .animation(.bouncy(duration: 2), value: change)
                Circle()
                    .overlay(Text("extra").foregroundStyle(.white))
                    .animation(.bouncy(extraBounce: 0.5), value: change)
                Circle()
                    .overlay(Text("+, +").foregroundStyle(.white))
                    .animation(.bouncy(duration: 0.8, extraBounce: 0.4), value: change)
            }
            .foregroundStyle(.gold)
            .frame(height: 100)
            .frame(maxWidth: .infinity, alignment: change ? .trailing : .leading)
            Button("Change") {
                change.toggle()
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title)
    }
}

#Preview {
    Delay()
}
