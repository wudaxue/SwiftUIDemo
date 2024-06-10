//
//  BannerText.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/9.
//

import SwiftUI

struct BannerText: View {
    var text: String
    var backColor: Color
    var textColor: Color
    var body: some View {
        Text(text)
            .font(.title)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backColor)
            .foregroundColor(textColor)
    }
    init(_text: String, backColor: Color = Color.orange, textColor: Color = Color.primary) {
        self.text = _text
        self.backColor = backColor
        self.textColor = textColor
    }
}
