//
//  TitleText.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/9.
//

import SwiftUI

struct TitleText: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.largeTitle)
    }
    init(_ title: String) {
        self.title = title
    }
}
