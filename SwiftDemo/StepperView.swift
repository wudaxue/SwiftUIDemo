//
//  StepperView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/10.
//

import SwiftUI

struct StepperView: View {
    @State private var stepperValue: CGFloat = 1.0
    @State private var expand = false
    
    var body: some View {
        VStack(spacing: 20) {
//            Image(systemName: "sun.max.fill")
//                .padding()
//                .foregroundStyle(.white)
//                .background(Circle()
//                    .fill(Color.green)
//                    .scaleEffect(expand ? 20 : 1)
//                    .ignoresSafeArea())
//            // Change a value that will trigger the animation
//                .onAppear { expand.toggle() }
//                .animation(.easeIn, value: expand)
            ZStack {
                ForEach(0...40, id: \.self) { _ in
                    Circle()
                        .foregroundStyle(.green).opacity(0.2)
                        .frame(width: .random(in: 10...100),
                               height: .random(in: 10...100))
                        .position(x: .random(in: stepperValue...400),
                                  y: .random(in: stepperValue...400))
                        .animation(.default, value: stepperValue)
                }
            }
            Stepper("Adjust", value: $stepperValue, in: 1.0...5.0)
                .padding()
        }
        .font(.title)
    }
}

#Preview {
    StepperView()
}
