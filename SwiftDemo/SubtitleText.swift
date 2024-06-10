//
//  SubtitleText.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/9.
//

import SwiftUI

struct SubtitleText: View {
    var subtitle: String
    var body: some View {
        Text(subtitle)
            .font(.title)
            .foregroundColor(.gray)
    }
    init(_ subtitle: String) {
        self.subtitle = subtitle
    }
}
