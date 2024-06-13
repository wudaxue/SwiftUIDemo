//
//  GroupBoxView.swift
//  SwiftDemo
//
//  Created by wuxue on 2024/6/12.
//

import SwiftUI

struct GroupBoxView: View {
    var body: some View {
        VStack(spacing: 40) {
            GroupBox("My Content") {
              Text("This is my groupbox. Isn't it cool. It's like a card view.Awesome!")
            }
            .frame(width: 240)
            .groupBoxStyle(.music)
            
            GroupBox {
                GroupBox {
                    MusicPlayerView()
                }
            } label: {
                Label("Now Playing", systemImage: "music.note")
            }
            .groupBoxStyle(.music)
        }
        .padding()
    }
}

struct MusicPlayerView: View {
    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.secondary)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())
                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                }
                Spacer()
            }
            .padding(.bottom, 8)
            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)
            HStack(spacing: 30) {
                Image(systemName: "backward.fill")
                Image(systemName: "pause.fill")
                Image(systemName: "forward.fill")
            }
//            .foregroundColor(.secondary)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
    }
}


struct MusicGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
//                .fontDesign(.monospaced)
                .foregroundColor(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}

#Preview {
    GroupBoxView()
}
