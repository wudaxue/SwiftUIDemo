//
//  testDemo.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/11.
//

import SwiftUI

struct testDemo: View {
    @State private var change1 = false
    @State private var color1 = Color.green
    @State private var change2 = false
    @State private var color2 = Color.green
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .fill(color1)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: change1 ? .trailing : .leading)
            Circle()
                .fill(color2)
                .frame(height: 100)
                .frame(maxWidth: .infinity, alignment: change2 ? .trailing : .leading)
            Button("Change") {
                withAnimation(.spring(bounce: 0.6), completionCriteria: .logicallyComplete) {
                    change1.toggle()
                } completion: {
                    color1 = .red
                }
                withAnimation(.spring(bounce: 0.6), completionCriteria: .removed) {
                    change2.toggle()
                } completion: {
                    color2 = .red
                }
            }
            .font(.title)
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    testDemo()
}
